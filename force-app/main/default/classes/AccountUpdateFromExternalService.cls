public class AccountUpdateFromExternalService {
    @invocableMethod (Label='Update Financial Code')
    public static void updateAccountsWithFinancialCode(List<Id> accountIds){
        callOutMethod(accountIds[0]);
        
    }
   
    @future(callout=true)
    public static void callOutMethod(Id acId){
        //List<Account> accs = [SELECT Id,Financial_Code__c,Is_Affiliated__c, Revenue__c FROM Account WHERE Id IN: idList];
        //    update accs;
        HTTP h = new HTTP();
        HTTPRequest request = new HTTPRequest();
        //HTTPResponse response = new HTTPResponse();
        String str = json.serialize(acId);
        request.setEndpoint('https://kubotaqa-developer-edition.ap4.force.com/services/apexrest/getFinancialData?accountId=000');
        request.setMethod('GET');
        request.setHeader('content-type', 'application/json');
        //request.setBody(str);
        
        HTTPResponse response= h.send(request);
        system.debug('**Response**'+response.getBody());
/*        
        If(response.getStatusCode()!=200){
            return;
        }
/*     Map<String, object> accountMap = (Map<String,Object>) json.deserializeUntyped(response.getBody());
        Map<String, object> stringMap = (Map<String,Object>) accountMap.get(acId);
        
        List<Account> accountList = new List<Account>();

        List<Account> accountList = (List<Account>) json.deserialize(response.getBody(), List<Account>.class);
        Account a = [SELECT Id, Financial_Code__c FROM Account WHERE Id IN: accountIds];
        a.Financial_Code__c = accountList.Financial_Code__c;
        update a;
        
        for(String s : accountMap.keySet()){
            Account a  = new Account();
            a.Id = (Id) s;
            a.Financial_Code__c = (String) stringMap.get('financialCode');
            a.Revenue__c = (Integer)stringMap.get('revenue');
     if(stringMap.get('revenue') != null){
                a.Financial_Data_Populated__c = true;
            } 
            a.Is_Affiliated__c  = (Boolean)stringMap.get('isAffiliated');
            accountList.add(a);
        }
         List<Id> accIds = new List<Id>();
        for(Account a : accountList){
            accIds.add(a.Id);
        }
      */
      // update accountList;
      // 
      AccountWrapper aw  = (AccountWrapper) json.deserialize(response.getBody(), AccountWrapper.Class);
      AccountWrapper aw1 = new AccountWrapper();
      aw1.revenue = aw.revenue;
      aw1.financialCode = aw.financialCode;
      aw1.isAffiliated = aw.isAffiliated;
      Account a = [SELECT Id,Financial_Data_Populated__c,Is_Affiliated__c,Revenue__c,Financial_Code__c, Owner.Email FROM Account WHERE Id=:acId ];
      a.Revenue__c = aw1.revenue;
      a.Financial_Code__c = aw1.financialCode;
      a.Is_Affiliated__c = aw1.isAffiliated;
      a.Financial_Data_Populated__c = true;
       system.debug('**AccountToBeUpdatedId**'+a.Id); 
      update a; 
      /*String emailId = 
      Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
       message.toAddresses = new String[] { 'abc2@gmail.com', 'abc2@gmail.com' };
*/
    }
    
    public class AccountWrapper{
        Public Integer revenue;
        Public String financialCode;
        Public Boolean isAffiliated;
    }
   
}