public class AnimalLocator {
    public static string getAnimalNameById (Integer id){
        Http http = new Http();
        String strp ='';
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response= http.send(request);
        if (response.getStatusCode()==200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> animals = (map<string,object>) results.get('animal');
            strp = string.valueOf(animals.get('name'));            
        }       
        return strp;
    }
}