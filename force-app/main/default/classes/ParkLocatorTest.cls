@isTest
public class ParkLocatorTest {
    testmethod static void testCollOut(){
        test.setMock(WebServiceMock.class, new ParkServiceMock());
        System.assertEquals('Park1',ParkLocator.Country('India')[0]); 
        System.assertEquals('Park2',ParkLocator.Country('India')[1]);
        System.assertEquals('Park3',ParkLocator.Country('India')[2]);           
    }
}