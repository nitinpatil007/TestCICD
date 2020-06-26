global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext sc)
    {
       List<Lead> leadList = [select ID, LeadSource from Lead where LeadSource='' Limit 200 ]; 
        List<Lead> LeadUpdate = new List<Lead>();
        for(lead l : leadList){
            l.LeadSource='Dreamforce';
            LeadUpdate.add(l);
        }
        update LeadUpdate;
    }
}