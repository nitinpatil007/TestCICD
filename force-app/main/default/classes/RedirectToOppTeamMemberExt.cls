/*
* @author :      Nitin Patil
* description :  ST-4277 Add Permission for LAs to Add Opportunity Team Members, the Extension class for RedirectToOppTeamMember page 
* <runTest></runTest>
*/

public without sharing class RedirectToOppTeamMemberExt {

    private final Opportunity opp;

   

    public RedirectToOppTeamMemberExt(ApexPages.StandardController stdController) {

        this.opp = (Opportunity)stdController.getRecord();

    }

   

    public PageReference doRedirectAction(){

        //doing a DML as well

        PageReference pageRef = new PageReference('/apex/MultipleRecordCreationPage');

        pageRef.setRedirect(true);

        pageRef.getParameters().put('oppId', opp.Id);

        return pageRef;

    }

}