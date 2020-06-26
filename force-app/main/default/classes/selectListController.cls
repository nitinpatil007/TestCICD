public with sharing class selectListController {
    List<String> countries = new List<String>();
    
    public List<String> getcountries (){
     return countries;
    }
   
    public void setcountries (List<String> countries){
    
     this.countries = countries;
    }
   
  
    public PageReference test() {
        return null;
    }


    public List<SelectOption> getItems() {
     List<SelectOption> op = new List<SelectOption>();
     op.add(new SelectOption('US','United States'));
     op.add(new SelectOption('Mexico','Mexico'));
     op.add(new SelectOption('Ind','India'));     
        return op;
    }   
    
}