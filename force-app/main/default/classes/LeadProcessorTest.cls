@istest
public class LeadProcessorTest {
    @istest public static void testLeadProcessorTest(){
        
       List<Lead> leads = new list<Lead>();
        for(Integer i=0;i<200;i++){
            lead l =new lead();
            l.FirstName ='firstname'+i;
            l.LastName = 'LastName'+i;
            l.Company = 'Accenture';
            leads.add(l);
        
        }
        insert leads;
        test.startTest();
         LeadProcessor lp = new LeadProcessor();
         Database.executebatch(lp);
        test.stopTest();
    }
}