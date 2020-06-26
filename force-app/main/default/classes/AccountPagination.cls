public class AccountPagination {
    public final Account acct;
    public AccountPagination(ApexPages.StandardSetController controller) {
       this.acct= (Account) controller.getRecord();
    }
    
    public ApexPages.StandardSetController accts {
    get{ if (accts==null){
        accts= new ApexPages.StandardSetController(Database.getQueryLocator([Select name from Account where ID Not IN (Select AccountId from Opportunity where IsClosed=true)])); 
    }
    return accts; 
    }
    set;
    }
    public List<Account> getAccountPagination(){
    
      return (List<Account>) accts.getRecords();
    }
}