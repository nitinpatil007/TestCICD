public class AccountProcessor {

    @future 
    public static void countContacts(list<id> accId){
        List<Account> accList = [select id, Number_of_Contacts__c, (Select ID from contacts) from Account where ID IN :accId];
        
        for(Account acc: accList){
            
            List<Contact> con =acc.contacts;
            acc.Number_of_Contacts__c = con.size();
            
        }
        Update accList;
    }
    
}