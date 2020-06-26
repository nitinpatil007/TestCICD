/**
 * Designed to be used in Flow to retrieve all the custom permission sets
 * assigned to the given user ids. Excludes permission sets tied to profiles.
 */
public with sharing class GetUserPermissionSetsInvocable {

    @InvocableMethod(
        label = 'UPS: Get User Permission Set Assignments'
        description = 'Get User Permission Set Assignments'
    )
    public static List<Response> execute( List<Request> requests ) {

        System.debug( 'User Requests: ' + requests );

        Set<ID> userIds = new Set<ID>();

        for ( Request req : requests ) {
            userIds.add( req.userId );
        }

        // we query permission sets by user map so that
        // we can easily correlate the responses back to
        // original request in the same order as the requests
        // came in, this is important when process builder or
        // flow is bulkifying the requests
        Map<ID, User> usersMap = new Map<ID, User>([
            SELECT
                id,
                (
                    SELECT
                        id,
                        permissionSetId,
                        permissionSet.label,
                        permissionSet.name
                        // add more fields here as needed from the permission set
                    FROM
                        PermissionSetAssignments
                    WHERE
                        permissionSet.isOwnedByProfile = false
                )
            FROM
                User
            WHERE
                id IN :userIds
        ]);

        List<Response> responses = new List<Response>();

        for ( Request req : requests ) {

            // now correlate the responses to the requests
            // so we return them in same order
            User usr = usersMap.get( req.userId );

            Response res = new Response();

            // I like to return some token on the response
            // as confirmation what request it came from
            res.userId = usr.id;

            // If user is not assigned any permission sets then we want our response value
            // to remain null (see line above) because in Flow we cannot easily check if a
            // collection is empty but we can check if a collection variable is null.
            // Other than this specific scenario with Flow and Invocable Apex, code should
            // never return null lists/sets/maps but rather empty ones instead by good design.
            // http://salesforce.stackexchange.com/questions/77173/list-isempty-vs-list-size-0-vs-list-null
            res.permissionSetAssignments = ( usr.permissionSetAssignments.size() > 0 ) ? usr.permissionSetAssignments : null;

            responses.add( res );

        }

        return responses;
    }

    // -------------------------------------------------------------

    public class Request {

        @InvocableVariable(
            label = 'User ID'
            description = 'User whose permission sets to get'
            required = true
        )
        public ID userId;

    }

    public class Response {

        @InvocableVariable(
            label = 'User ID'
            description = 'User whose assigned permission sets were retrieved'
        )
        public ID userId; // just so response has context of which user the permission sets are for

        @InvocableVariable(
            label = 'Permission Set Assignments'
            description = 'Permission sets assigned to user'
        )
        public List<PermissionSetAssignment> permissionSetAssignments;

    }

}