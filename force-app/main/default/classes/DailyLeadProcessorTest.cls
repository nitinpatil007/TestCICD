@isTest
public class DailyLeadProcessorTest {
@testSetup
    static void setup(){
        List<lead> leads = new List<Lead>();
        for(integer i=100; i<300; i++){
            leads.add(new Lead(lastname='Demo'+i,company='Accenture'));
        }
        insert leads;        
    }
    public static testmethod void testSchedulable(){
        String sch = '00 10 02 22 03 ? 2021';
        
        Test.startTest();
        system.schedule('Demo Job', sch, new DailyLeadProcessor());
        Test.stopTest();
        
        system.assertEquals(200, [Select Count() from Lead where LeadSource='DreamForce']);
            
    }
}