@RestResource (urlMapping='/Case/*')
global class RestResourceDemo {
  @HttpGet
    global static Case doGet(){
        RestRequest req = RestContext.request;
        RestResponse res = restContext.response;
        Id caseId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        
        Case c = [select ID, CaseNumber,Type, Status, AccountId,ContactId,OwnerId from Case where ID =: caseId];
        
        return c;
    }
   @HttpPost
    global static ID create(String priority, string type, string status, string origin){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        Case c = new Case();
        c.Priority= priority;
        c.Origin = origin;
        c.Status = status;
        c.Type = type;
        c.Subject = 'RestResource Demo Case';
        Insert c;
        
        return c.Id;        
    }
}