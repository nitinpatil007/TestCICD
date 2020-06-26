public class ChainingDemoBatchClass implements Database.Batchable<sobject> {
    //Global static 
    public List<Account> start (Database.BatchableContext bc){
        	return [SELECT Id, Industry, Name FROM Account];    
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account a : scope){
            if(a.Industry != 'Technology'){
                a.Industry = 'Technology';
            }
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        Database.executeBatch(new ChainingDemoBatchClass(), 50);
    }
}