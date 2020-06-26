global class OwnerReassignment  implements Database.Batchable<sObject>, Database.Stateful {
       String query;
       Id fromUserId;
       Id toUserID;
       String email;
    global Database.QueryLocator Start(Database.BatchableContext bc){
        
        return database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, list<sObject> scope){
         List<account> accUpd = new list<Account>();
        for(sObject s :scope){           
            Account a = (Account) s;
            if( a.ownerId == fromUserId){
                a.OwnerId = toUserID;
            }
            accUpd.add(a);
        }
        update accUpd;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses( new List<String> {email});
        mail.setReplyTo('nitinledange007@gmail.com');
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Batch Process Completed');
        mail.setPlainTextBody('Batch Process has completed');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
       }
}