public class SummaryStatsController {
    
    public Integer getVeryLargeSummaryStat() {
     Integer oppscount= [select count() from opportunity where IsClosed = true];
        
        return oppscount;
    }

}