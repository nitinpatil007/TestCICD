public class ContinuationController {

    public String result { get; set; }
    
    Public String requestLabel;

    public Object startRequest() {
    
        Continuation con = new Continuation(40);
        con.ContinuationMethod = 'ProcessResult';    
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://th-apex-http-callout.herokuapp.com');
            req.setMethod('GET');
            
            this.requestLabel = con.addHttpRequest(req);
            
        return con;
    }
    public Object ProcessResult(){
      
      HttpResponse res = Continuation.getResponse(this.requestLabel);
      
      this.result = res.getBody();
      
      return null;
    
    }

}