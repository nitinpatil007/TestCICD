public class myControllerExtension {

    private final Account acct;
    
    ID id= APexPages.CurrentPage().getParameters().get('id');
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public myControllerExtension(ApexPages.StandardController stdController) {
        
        if( id==Null){
         this.acct = new Account();
        }
        else{
             this.acct = (Account)stdController.getRecord();
        
        }
    }

    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
    
    }