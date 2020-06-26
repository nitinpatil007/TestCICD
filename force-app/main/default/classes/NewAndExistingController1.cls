public class NewAndExistingController1 {

    public Account account { get; set; }
    
    public NewAndExistingController1 (){
    
       ID id = ApexPages.currentPage().getParameters().get('id');
       
       if( id==NULL){
         account= new Account();
       
       }
       else{
       
        account= [select ID, Name, phone, industry from Account where ID=:id];
        
       }
    
    }
    
    public pageReference save(){
      upsert account;
      
      return new ApexPages.StandardController(Account).view();    
    }
}