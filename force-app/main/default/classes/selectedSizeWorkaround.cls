public class selectedSizeWorkaround {
    Apexpages.StandardSetController setCon;
    public selectedSizeWorkaround(ApexPages.StandardSetController controller) {
        setCon = controller;
    }
    public Integer getmySelectedSize(){
       return setCon.getSelected().size();
    }
    
    public Integer getmyRecordsSize(){
    
      return setCon.getRecords().size();
    
    }
}