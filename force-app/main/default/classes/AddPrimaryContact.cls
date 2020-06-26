public class AddPrimaryContact  implements Queueable{
    contact con;
    String state;
    
    public AddPrimaryContact(Contact con, String State){           
        this.con = con;
        this.state = State;
    }
    public void execute(QueueableContext qc){
        List<Account> accs = [Select ID, Name,(select LastName, firstname, AccountID from Contacts) from Account where BillingState =: state limit 200];
        List<contact> cons = new list<Contact>();
        for(Account acc: accs){
            Contact cont = con.clone(false,false,false,false);
            cont.AccountID = acc.Id;
            cons.add(cont);
        }
        
          Insert cons;            
        
        
    }
}