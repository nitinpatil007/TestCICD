public with sharing class exampleCon1 {
    public integer count =0;
    public PageReference incrementCounter() {
        count++;
        return null;
    }


    public Integer getCount() {
        return count;
    }

}