public class AddmultipleAccountsController2 {

    public list<Account> listAccount { get; set; }
    
    public AddmultipleAccountsController2 (){
      
    listAccount = new list<Account>();
    
    }
    public void addAccount(){
     Account acc = new Account();
     listAccount.add(acc);
    }
    
    public PageReference saveAccount(){
    
    
     insert listAccount;
     
     return null;
    }
}