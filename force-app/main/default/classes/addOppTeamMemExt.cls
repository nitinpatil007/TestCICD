@isTest
public class addOppTeamMemExt {
@isTest
    public static void addOppTeamMemberTest(){
        //TestUtil.commonSetup();
        
        //Opportunity op = TestUtil.createTestOpportunity(null, null, true);
        //TestUtil.createCountry();
    	//Contact c = TestUtil.createTestContact();

        //Id rtExpertOpp = Utils.getRecordTypeId(Utils.RTDEV_EXPERT_OPPORTUNITY);

        Opportunity opp = new Opportunity();
        opp.Name = 'test opp';
        opp.StageName = 'Open In-Progress';
        opp.CloseDate = system.today();
    	insert opp;
        System.debug('***Opportunity***'+opp);
        
        Id uId = userInfo.getUserId();
        System.debug('****User****'+uId);
        
        //ystem.assertEquals(true, u.Id!=null);
        PageReference pageRef = Page.AddOpportunityTeamMemberUpdated;
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