@isTest
private class GetUserPermissionSetsInvocableTest {

    @isTest
    static void test_request() {

        Profile p = [ SELECT id FROM Profile WHERE name = 'Standard User' ];

        List<PermissionSet> permSets = [ SELECT id FROM PermissionSet WHERE isOwnedByProfile = false LIMIT 3 ];

        User user1;

        // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_tools_runas.htm
        System.runAs( new User( id = UserInfo.getUserId() ) ) {

            user1 = newUser( p.id, 'Alpha', 'User 1', 'user_1@example.com' );

            insert new List<User>{ user1 };

            List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();

            for ( PermissionSet ps : permSets ) {
                psa.add( new PermissionSetAssignment(
                    assigneeId = user1.id,
                    permissionSetId = ps.id
                ));
            }

            insert psa;

        }

        Test.startTest();

        GetUserPermissionSetsInvocable.Request req = new GetUserPermissionSetsInvocable.Request();
        req.userId = user1.id;

        List<GetUserPermissionSetsInvocable.Response> responses = GetUserPermissionSetsInvocable.execute( new List<GetUserPermissionSetsInvocable.Request>{ req } );

        Test.stopTest();

        Integer countAssignedPermSets = [ SELECT count() FROM PermissionSetAssignment WHERE assigneeId = :user1.id AND permissionSet.isOwnedByProfile = false ];

        System.assertEquals( 1, responses.size() );
        System.assertEquals( countAssignedPermSets, responses[0].permissionSetAssignments.size() );

    }

    private static User newUser( ID profileId, String firstName, String lastName, String email ) {
        Integer rand = Math.round( Math.random() * 1000 );
        return new User(
            isActive = true,
            profileId = profileId,
            alias = firstName.substring(0,1) + lastName.substring(1,5),
            firstName = firstName,
            lastName = lastName,
            email = email,
            username = rand + email,
            emailEncodingKey = 'UTF-8',
            languageLocaleKey = 'en_US',
            localeSidKey = 'en_US',
            timeZoneSidKey = 'America/Chicago'
        );
    }

}