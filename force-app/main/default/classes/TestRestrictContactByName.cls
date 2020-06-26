@isTest
public class TestRestrictContactByName {

    @isTest static void testMethod1(){
        
        List<Contact> con = new List<Contact>{new Contact(LastName='INVALIDNAME'),
                                            new Contact(LastName='Neymer Jr')};
                                                
        Database.SaveResult[] srList = Database.insert(con, false);                                        
        
        for(Database.SaveResult sr:srList){
            
            if(sr.isSuccess()){
                System.debug('Inserted Contact:'+sr.getId());
                
            }
            else{
                for(Database.Error er : sr.getErrors()){
                    
                    System.debug('Errored Contact' +er.getFields());
                    System.debug('Following error occured :'+er.getMessage());
                } 
                
            }
            
        }
    }
}