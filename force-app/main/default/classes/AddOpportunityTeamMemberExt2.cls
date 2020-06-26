/*
* @author :      Nitin Patil
* description :  ST-4277 Add Permission for LAs to Add Opportunity Team Members, for Extension class to add new opportunityTeamMember 
* <runTest>AddOpportunityTeamMemberExtTest</runTest>
*/
public without sharing class AddOpportunityTeamMemberExt2 {

    private ApexPages.StandardController sc;

    public Id oppId;
    
    Public Integer recordIndex {get;set;}

    public List<OpportunityTeamMemberWrapper> oTMList {get; set;}

    public AddOpportunityTeamMemberExt2(ApexPages.StandardController stdController) {

        this.sc = stdController;
        
        this.oppId = apexpages.currentpage().getparameters().get('oppId');

        oTMList = new List<OpportunityTeamMemberWrapper>();
        
        for(Integer i=0;i<1;i++){
        
          OpportunityTeamMember otmRec = new OpportunityTeamMember(OpportunityId = oppId);
          oTMList.add(new OpportunityTeamMemberWrapper(otmRec,false));          
        }
    }
    public PageReference Save() {
        //insert OTMList;
        List<OpportunityTeamMember> deleteOTMList = new List<OpportunityTeamMember>();
        List<OpportunityTeamMember> insertOTMList = new List<OpportunityTeamMember>();
        List<Database.Error> dbErrors = new List<Database.Error>();
        for(OpportunityTeamMemberWrapper oRec : oTMList){
              system.debug('***INSIDE FOR EACH**');
              if(oRec.deleteOTM == true){
                 system.debug('***INSIDE TRUE IF BLOCK **');
                 deleteOTMList.add(oRec.otm);                
              }
              
              insertOTMList.add(oRec.otm);
              
        }
        
        if(!deleteOTMList.isEmpty()){
           system.debug('***INSIDE DELETE BLOCK **');
           //Delete deleteOTMList;
           try {

                List<Database.DeleteResult> results = Database.delete(deleteOTMList, false);
                system.debug('* [results]: **' + results);
                for (Database.DeleteResult result : results) {
                    if (! result.isSuccess()) {
                        dbErrors.addAll(result.getErrors());
                    }
                }

            } catch(Exception e) {

                    system.debug('***Delete Exception***'+e);
            }
        }
        
        if(!insertOTMList.isEmpty()){
            system.debug('***INSIDE INSERT BLOCK **');
            //insert insertOTMList;
             try {

                List<Database.SaveResult> results = Database.insert(insertOTMList, false);
                system.debug('* [results]: **' + results);
                for (Database.SaveResult result : results) {
                    if (! result.isSuccess()) {
                        dbErrors.addAll(result.getErrors());
                    }
                }

            } catch(Exception e) {

                    system.debug('***Delete Exception***'+e);
            }
        }
        system.debug('***BEFORE PAGEREFERENCE ***');
        PageReference pageRef = new PageReference('/'+oppId);

        pageRef.setRedirect(true);

        return pageRef;
        //system.debug('***AFTER PAGEREFERENCE**'+pageRef);
    }  
    
    public pageReference addOneMoreMember(){
        OpportunityTeamMember otm = new OpportunityTeamMember(OpportunityId = oppId);
        
        oTMList.add(new OpportunityTeamMemberWrapper(otm,false));
        return null;
    }
        
    public PageReference cancel() {
    
        PageReference pageRef = new PageReference('/'+oppId);
        //PageReference pageRef = new PageReference('https://www.google.com');
        pageRef.setRedirect(true);

        return pageRef;
    }
   public class OpportunityTeamMemberWrapper{
      public OpportunityTeamMember otm {get;set;}
      public Boolean deleteOTM {get;set;}
      
      public OpportunityTeamMemberWrapper(OpportunityTeamMember o, Boolean deleteIt){
         this.otm = o;
         this.deleteOTM = deleteIt;
      }
   } 
}