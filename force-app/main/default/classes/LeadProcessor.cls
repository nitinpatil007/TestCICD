global class LeadProcessor implements Database.Batchable<sobject>, Database.Stateful {
     
    global Database.QueryLocator start (Database.BatchableContext bc){
        
        return Database.getQueryLocator('Select ID, LeadSource from Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        
        for(Lead leads : scope){
            
            leads.LeadSource = 'Dreamforce';
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
    }
}