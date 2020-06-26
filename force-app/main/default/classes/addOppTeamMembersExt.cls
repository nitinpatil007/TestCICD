public class addOppTeamMembersExt {
    public final Opportunity opps;
    Public final String oppId ; 
    //public OpportunityTeamMember del;
    //public List<OpportunityTeamMember> addattendeeList {get;set;}
    //public List<OpportunityTeamMember> delattendeeList {get;set;}
    public List<OpportunityTeamMember> attendeeList {get;set;}
    //public Integer totalCount {get;set;}
    public Integer rowIndex {get;set;}
    
    //public List<OpportunityTeamMember> delAttendees {get; set;} 
    public addOppTeamMembersExt(ApexPages.StandardController controller) {
        attendeeList = new List<OpportunityTeamMember> ();
        oppId = controller.getId();
        opps = (Opportunity) controller.getRecord();
        system.debug('***OPPID***'+oppId);
        //this.opps = (Opportunity) controller.getRecord();
        //system.debug('***OPPS***'+this.opps);
        //attendeeList = [Select id, userId, TeamMemberRole,OpportunityAccessLevel from OpportunityTeamMember where opportunityId =: opps.Id];
        //for(Integer i=0; i<1;i++){
        //OpportunityTeamMember otmRec = new OpportunityTeamMember(OpportunityId = opps.Id);
        //system.debug('****otmRec***'+otmRec);
        //attendeeList.add(new OpportunityTeamMember(OpportunityId = opps.Id));
        addRow();
        //}
        
        
        
        //totalCount = attendeeList.size();
        
        //delattendeeList = new List<OpportunityTeamMember>();
        //delattendees = new List<OpportunityTeamMember>();
    }
    
    public void addRow(){
        //addattendeeList = new List<OpportunityTeamMember>();
        attendeeList.add(new OpportunityTeamMember(opportunityId = opps.Id));
    }
    
    public PageReference save(){
        
        insert attendeeList;
        //delete delattendeeList;
        //return (new ApexPages.StandardController(opps)).view();
        PageReference pageRef = new PageReference('/'+opps.Id);
        
        pageRef.setRedirect(true);
        
        return pageRef;
        
    } 
    
    public void deleteRow(){
        
        rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
        //System.debug('rowbe deleted ' + rowIndex );
        //System.debug('rowm to be deleted '+attendeeList[rowIndex]);
        //del = attendeeList.remove(rowIndex);
        attendeeList.remove(rowIndex);
        //delattendeeList.add(del);
        
    }
}