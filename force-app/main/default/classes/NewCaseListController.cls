public class NewCaseListController {
   
  public List<Case> getNewCases(){
  
     List<Case> cases1= [Select Id,Account.Name,CaseNumber,contact.name from Case Where Status='New' Limit 10];
     
     return cases1;
       
  }

}