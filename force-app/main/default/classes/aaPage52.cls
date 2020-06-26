public class aaPage52 {

    List<Account> results;
    List<Contact> con;

    public String searchText { get; set; }
    
    public List<Account> getResults() {
        return results;
    }
    
        public List<Contact> getContacts() {
        return con;
    }
    
    public pageReference find(){
     results = [Select Name,Phone,Industry,(Select FirstName,LastName, Account.Name from Contacts) from Account where name LIKE :searchText+'%']; 
     con = new list<contact>();
     If(results.size()!=0){
     /*for(Integer i=0; i< results.size(); i++){
       cont  = [Select FirstName, LastName from Contact where AccountID =:results[i].Id];
       
     } */
     for(Account acc : results){
      con.addAll(acc.contacts);
     }
     }
     update con;
     return null;
    } 
    
}