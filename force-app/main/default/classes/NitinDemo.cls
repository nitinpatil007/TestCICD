public class NitinDemo {
	    public String insertBook(Integer num){
        System.debug('Start'+Limits.getLimitDmlStatements());
    	Book__c b = new Book__c(Name = 'Test Book '+ num, Price__c = 1000);
    	insert b;
        System.debug('Middle'+Limits.getLimitDmlStatements());
        List<Book__c> accts = new List<Book__c>();
        for(Integer i=0; i< num; i++){
            Book__c a = new Book__c(Name='a'+i);
            accts.add(a);
        }
        insert accts;
        System.debug('End'+Limits.getLimitDmlStatements());
        return b.Id;
    }

}