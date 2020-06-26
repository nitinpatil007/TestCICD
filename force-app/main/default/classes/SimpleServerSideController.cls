public class SimpleServerSideController {
    @AuraEnabled (cacheable=true)
    public static string serverEcho(String firstName){
        return 'Hello '+firstName;
    }    
}