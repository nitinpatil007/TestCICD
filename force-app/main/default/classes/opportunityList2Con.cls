public class opportunityList2Con {
  
   public ApexPages.StandardSetController setcon{
   set;
   get{ if(setcon==null){
   
    setcon = new ApexPages.StandardSetController(Database.getQueryLocator ([Select ID, Name, CloseDate from opportunity limit 10]));
   
   }
   return setcon;
   }
   
   }
    public List<opportunity> getOpportunities() {
        return (List<opportunity>) setcon.getRecords();
    }

}