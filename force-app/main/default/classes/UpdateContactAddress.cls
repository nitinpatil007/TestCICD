/* 	@Author 		: Nitin Patil
 * 	@CreatedDate 	: 12th June 2020 
 *	@Version		: 1.0
 *	@Desc			: This is a Batch class to sync/update the Children Contacts mailing Address (City, Country) as per Parent Accounts Billing Address (City, Country) 	
*/

public class UpdateContactAddress implements Database.Batchable <SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, MailingCity, MailingCountry, AccountId, Account.BillingCity, Account.BillingCountry'+' FROM Contact WHERE AccountId != NULL');
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> toUpdateContactList = new List<Contact>();
        for(Contact c : scope){
            c.MailingCountry = c.Account.BillingCountry != NULL ?  c.Account.BillingCountry : 'Not available' ;
            c.MailingCity = c.Account.BillingCity != NULL ? c.Account.BillingCity : 'Not available' ;
            toUpdateContactList.add(c);
        }        
        List<Database.saveResult> updateResults = Database.update(toUpdateContactList);
        for(Database.saveResult updateResult : updateResults){
            if(!updateResult.isSuccess()){
                // Operation failed, so get all errors                
        		for(Database.Error err : updateResult.getErrors()) {                    
            		System.debug(err.getStatusCode() + ': ' + err.getMessage());
            		System.debug('Account fields that affected this error: ' + err.getFields());
        		}
            }
        }
        
    }
    public void finish(Database.BatchableContext bc){
        //we can send mail or notification to users about completion of the records updation
        //If the records count is more than 50  Million then we can call the same batch class here i.e. chaining of batch class
    }
}