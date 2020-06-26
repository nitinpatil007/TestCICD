public class UpdateAccountEmailWithInvocableMethod {
   @invocableMethod (Label='Update the Account Rating to Hot' description='invoke using Process Builder')
    public static void updateRating ( List<ID> ids ) {
        List<Account> accts = new List <Account>();
        List<Account> acc = [select ID, Name, Rating from Account Where ID IN:ids];
        
        for(Account a : acc){
            
            a.Rating = 'Hot';
            accts.add(a);
        }
             Update accts;
        
    }   
    
}