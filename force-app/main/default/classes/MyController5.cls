public class MyController5 {
  Account account;

  public PageReference save() {
    try{
        update account;
       }
    catch(DmlException ex){
        ApexPages.addMessages(ex);
       }
    return null;
  }

  public String getName() {
    return 'MyController';
  }

  public Account getAccount() {
    if(account == null)
      account = [select id, name, numberoflocations__c, Number_of_Contacts__c from Account
        where id = :ApexPages.currentPage().getParameters().get('id')];
      return account;

  }
}