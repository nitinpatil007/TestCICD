public class AccountContactController 
{
 private ApexPages.StandardController stdCtrl {get; set;}
   
 public List<Contact> conts {get; set;}
   
 public AccountContactController(ApexPages.StandardController std)
 {
  stdCtrl=std;
  setupContacts();
 }
   
 private void setupContacts()
 {
  conts=[select id, Name, Email, Phone from Contact where AccountId=:stdCtrl.getId()];
 }
}