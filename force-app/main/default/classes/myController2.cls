public class myController2 {
    public final Account account;
    
    public mycontroller2(){
       account=[select ID,Name from Account where ID =: ApexPages.currentPage().getParameters().get('id')];
    
    }
    public Account getAccount() {
        
        return account;
    }
    
    public pageReference save(){
      update account;
      return new ApexPages.StandardController(Account).view();
    
    }

}