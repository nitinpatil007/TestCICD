public class myControllerExtension34 {
    public list<Account> acct = [Select ID, Name from Account];
    
    public ApexPages.StandardSetController acc;
    
    
    
    public myControllerExtension34(ApexPages.StandardSetController controller) {
    
      controller.setPageSize(50);
      
      controller = new ApexPages.StandardSetController(acct);
      acc = controller;
    }
    
    
    
    public List<Account> getGreeting(){
    
              
        return (List<Account>) acc.getRecords();
      
    
    }
    
    public void getNext(){
    
    acc.Next();
    
    }

}