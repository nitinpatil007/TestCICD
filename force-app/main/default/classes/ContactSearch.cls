public class ContactSearch {

    public static List<Contact> searchForContacts(String Lastname,String MailingPostalCode){
        
        List<Contact> conList=[Select LastName,FirstName from Contact where LastName=:Lastname AND MailingPostalCode=:MailingPostalCode];
        
        return conlist;
    }
}