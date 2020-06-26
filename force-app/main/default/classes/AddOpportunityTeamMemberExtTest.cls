@isTest
public class AddOpportunityTeamMemberExtTest {
    @isTest
    public static void addOppTeamMemberTest(){
        //TestUtil.commonSetup();
        
        //Opportunity op = TestUtil.createTestOpportunity(null, null, true);
        //TestUtil.createCountry();
        //Contact c = TestUtil.createTestContact();
 
        //Id rtExpertOpp = Utils.getRecordTypeId(Utils.RTDEV_EXPERT_OPPORTUNITY);
 
        Opportunity opp = new Opportunity(); /*TestUtil.createTestOpportunity(
                null, //c, //Contact
                rtExpertOpp, //recordType
                null, //Country
                null, //State
                null, //partnerAccountId
                null, //partnerType
                null); //partnerCountry */
        opp.Name = 'test opp';
        opp.StageName = 'Open In-Progress';
        opp.CloseDate = system.today();
        insert opp;
        System.debug('***Opportunity***'+opp);
        
        Id uid = Userinfo.getUserId();  //TestUtil.setupEnterpriseUser();
        User u = new User(Id=uid);
        System.debug('****User****'+u);
        
        System.assertEquals(true, u.Id!=null);
        PageReference pageRef = Page.addOpportunityTeamMemberUpdated;
        Test.setCurrentPageReference(pageRef);
        //List<OpportunityTeamMember> oTMList = new List<OpportunityTeamMember>{new OpportunityTeamMember(userId=u.Id, opportunityId=op.Id)};
        ApexPages.CurrentPage().getparameters().put('Id', opp.Id);
        ApexPages.StandardController sc = new ApexPages.StandardController (opp);
        System.debug('***StandardController***'+ sc);
        addOppTeamMembersExt addOTM = new addOppTeamMembersExt(sc);
        system.debug('***addOTM***'+addOTM);
        //addOTM.attendeeList otmlist = [];
            
        //List<OpportunityTeamMember> otmList = new List<OpportunityTeamMember>{new OpportunityTeamMember(userId=u.Id, opportunityId=opp.Id)};
        //addOTM.addRow();
        Test.startTest();
        PageReference p = addOTM.save();
        system.debug('***PageReference P***'+p);
        //addOTM.deleteRow();
        //System.debug('***OTMList***'+ addOTM.attendeeList);
        Test.stopTest();
        //PageReference pg = addOTM.add
        //PageReference addOne = addOTM.addOneMoreMember();
        System.assertEquals(p.getUrl(), '/' + opp.Id);
        //System.assertEquals(pg.getUrl(), '/' + op.Id);
        
    }
}