public class MyHelloWorld {
    public static void addAccounts(Account[] accs){
         for(Account acc:accs){
         	if(acc.Description==''){
         		acc.Description='This is a Important Account record!!';
         	}
         	if(acc.Type=='Prospect' && acc.Rating==''){
         		acc.Rating='Hot';
         	}
         	else if(acc.Type=='Other' && acc.Rating==''){
         		acc.Rating='Cold';
         	}
         }
    
    }
}