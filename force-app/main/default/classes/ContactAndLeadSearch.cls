public class ContactAndLeadSearch {

    public static List<List<Sobject>> searchContactsAndLeads(String Lastname){
 
        List<List<Sobject>> searchList=[Find :Lastname IN ALL FIELDS Returning Contact(FirstName,LastName),Lead(FirstName,LastName) ];
        
                return searchList;
         
    
    }
}