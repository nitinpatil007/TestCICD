public with sharing class TestSharing {
    public String insertBook(Integer num){
        System.debug('Before'+Limits.getLimitDmlRows());
    	Book__c b = new Book__c(Name = 'Test Book '+ num, Price__c = 1000);
    	insert b;
        System.debug('Middle'+Limits.getLimitDmlRows());
        List<Account> accts = new List<Account>();
        for(Integer i=0; i< num; i++){
            Account a = new Account(Name='a'+i);
            accts.add(a);
        }
        insert accts;
        System.debug('End'+Limits.getLimitDmlRows());
        return b.Id;
    }
    
}