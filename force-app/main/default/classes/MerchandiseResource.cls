@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseResource {

private class Attach {
    String Body;
    String ContentType;
    String Name;
}
private class Merchandise {
    Account merchandise;
    list<Attach> attachments;
} 

@HttpPost
global static String doPost() {
    //json will be taken directly from RestContext
    Merchandise container = (Merchandise)System.JSON.deserialize(
        RestContext.request.requestBody.tostring(), 
        Merchandise.class);

    Account merch = container.merchandise;
    insert merch;

    list<attachment> attachmentToInsert = new list<attachment>();

    for (Attach att :container.attachments) {
        attachmentToInsert.add(
            new Attachment(parentId = merch.Id, name = att.name, 
                           ContentType = att.ContentType, 
                           Body = EncodingUtil.base64Decode(att.body)));
    }
    insert attachmentToInsert;

    return merch.id;
}}