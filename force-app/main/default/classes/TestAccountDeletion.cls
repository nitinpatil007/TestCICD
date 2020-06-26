@isTest
public class TestAccountDeletion {

    @isTest static void testAccountDeletionMethod(){
        
        Account acc=new Account(Name='Shane Bond');
        Insert acc;
        
        Opportunity opp=New Opportunity(Name=acc.Name+' Opportunity',CloseDate=system.today()+30,
                                        Type='New Customer',StageName='Prospecting',
                                        Amount=50000,AccountId=acc.Id);
        
        insert opp;
       
        Test.startTest();
        Database.DeleteResult res=database.delete(opp,false);
        Test.stopTest();
        
        System.assert(!res.isSuccess());

        System.assert(res.getErrors().size() > 0);

        System.assertEquals('You can not delete an account who has related opportunities!!',
                             res.getErrors()[0].getMessage());

        
        //System.debug(res.getErrors()[0].getMessage());
        
    }
}