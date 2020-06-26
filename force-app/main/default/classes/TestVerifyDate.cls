@isTest
public class TestVerifyDate {
   
      static testMethod void TestVerifyDate() {
      VerifyDate.CheckDates(System.today(),System.today().addDays(10));
      VerifyDate.CheckDates(System.today(),System.today().addDays(78));
          
          VerifyDate.CheckDates(System.today(),Date.newInstance(2016, 9, 11));
          
    }
}