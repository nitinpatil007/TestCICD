@isTest
public class AddPrimaryContactTest {
@testSetup
    public static void setup(){
        List<Account> act = new List<Account>();
        for(Integer i=0;i<50;i++){
            act.add(new Account(name='Demo Account'+i, billingState='NY'));
       }
        for(integer j=50; j<100;j++){
            
            act.add(new Account(name='Demo Account'+j, BillingState='CA'));
        }
       insert act;
    }
    
    @istest static void testQueueable(){
        Contact con = new Contact(lastname='Demo');	
        Test.startTest();
        system.enqueueJob(new AddPrimaryContact(con, 'NY'));
        system.enqueueJob(new AddPrimaryContact(con, 'CA'));
        Test.stopTest();
        system.assertEquals(50, [Select Count() from Contact where Account.BillingState='NY']); 
        system.assertEquals(50, [Select Count() from Contact where Account.BillingState='CA']);
    }
}