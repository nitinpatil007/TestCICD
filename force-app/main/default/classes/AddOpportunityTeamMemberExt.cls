/*
* @author :      Nitin Patil
* description :  ST-4277 Add Permission for LAs to Add Opportunity Team Members, for Extension class to add new opportunityTeamMember 
* <runTest></runTest>
*/
public without sharing class AddOpportunityTeamMemberExt {

    private ApexPages.StandardController sc;

    public Id oppId;

    public List<OpportunityTeamMember> newOTMList {get; set;}

    public AddOpportunityTeamMemberExt(ApexPages.StandardController stdController) {

        this.sc = stdController;
        
        this.oppId = apexpages.currentpage().getparameters().get('oppId');

        newOTMList = new List<OpportunityTeamMember>();
        
        for(Integer i=0;i<1;i++){
        
          OpportunityTeamMember otm = new OpportunityTeamMember(OpportunityId = oppId);
          newOTMList.add(otm);
          
        }
        

    }

   

    public PageReference Save() {

        /*Id oppId = apexpages.currentpage().getparameters().get('oppId');

        OpportunityTeamMember otm = new OpportunityTeamMember();

        otm.OpportunityId = oppId;

        otm.TeamMemberRole = newOTM.TeamMemberRole;

        otm.UserId = newOTM.UserId;

        otm.OpportunityAccessLevel = newOTM.OpportunityAccessLevel ;
        
        insert otm ;
        newOTMList.add(otm);
        */
        insert newOTMList;

        PageReference pageRef = new PageReference('/'+oppId);

        pageRef.setRedirect(true);

        return pageRef;

    }  
    
    public pageReference addOneMoreMember(){
        OpportunityTeamMember otm = new OpportunityTeamMember(OpportunityId = oppId);
        /*
        otm.TeamMemberRole = newOTM.TeamMemberRole;

        otm.UserId = newOTM.UserId;

        otm.OpportunityAccessLevel = newOTM.OpportunityAccessLevel ;
        */
        newOTMList.add(otm);
        return null;
    }
    public PageReference cancel() {
    
        PageReference pageRef = new PageReference('/'+oppId);

        pageRef.setRedirect(true);

        return pageRef;
    }
}