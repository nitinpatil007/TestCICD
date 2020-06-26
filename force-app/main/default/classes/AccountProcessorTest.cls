@isTest
public class AccountProcessorTest {
  @istest public static void testAccountProcessorTest()
  {
      
      Account acc= new Account();
      acc.name='Acc1';
      insert acc;
      
      Contact con= new Contact();
      con.Lastname='ConLast';
      con.AccountId=acc.Id;
      insert con;
      List<ID> accId = new List<ID>();
      accId.add(acc.Id);
         Test.startTest();
            AccountProcessor.countContacts(accId);
         test.stopTest();
      Account acct = [Select Id, Number_of_Contacts__c from Account where ID=:accId];
      system.assertEquals(acct.Number_of_Contacts__c, 1, True);
  }
}