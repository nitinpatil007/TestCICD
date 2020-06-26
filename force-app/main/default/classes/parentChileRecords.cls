public with sharing class parentChileRecords {
public List<Account> accountList{get;set;}
public List<Contact> contactList{get;set;}
Public Integer pageNum=0;
public Set<Id> accid{get;set;}
public Map<Id, List<Contact>> accIdconListMap { get; set; }
Map<Id, Account> accMap = new Map<Id, Account>();
public List<wrapperClass> wrapperList { get; set; } 

public parentChileRecords(){ 
accIdconListMap = new Map<Id, List<Contact>>();
wrapperList = new List<wrapperClass>();
accid = new Set<Id>(); 
accountList = [SELECT id,name,AccountNumber FROM Account];
if(accountList.size() > 0) {
for(Account ac : accountList) {
accid.add(ac.Id);
accMap.put(ac.Id, ac);
}
contactList = [SELECT Name, AccountId,Title FROM Contact WHERE AccountId IN : accid];
}
if(contactList.size() > 0) {
for(Contact con : contactList) {
if(!accIdconListMap.containsKey(con.AccountId)){
accIdconListMap.put(con.AccountId, new List<Contact>());
}
accIdconListMap.get(con.AccountId).add(con);
}
for(Id acId : accIdconListMap.keySet()) {
wrapperList.add(new wrapperClass(accMap.get(acId), accIdconListMap.get(acId)));
}
}
else{
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'No records are available'));
}

}
public pageReference next(){
   accountList = [SELECT id,name,AccountNumber FROM Account OFFSET :pageNum*20];
   pageNum++;
   return null;
}

public class wrapperClass{
public list<Contact> conList{get;set;}
public Account acc{get;set;}
public wrapperClass(Account aa, list<Contact> cc){
this.acc = aa;
this.conList = cc;
}
}
}