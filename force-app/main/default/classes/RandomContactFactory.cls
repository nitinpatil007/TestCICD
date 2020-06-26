public class RandomContactFactory {
    public static list<Contact> generateRandomContacts(Integer num, String LastName){
       
        list<Contact> conList=new list<Contact>();
        for(Integer i=0;i<num;i++){
        
          Contact con = new Contact (FirstName='Test'+i,LastName=LastName);
            conList.add(con);       
        }
        
        return conList;
    }
}