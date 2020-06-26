public class SampleController2
{
   public SampleController2()
   {
   
   }
   
   public pagereference performUpdate()
    {
     System.debug('..entered...performUpdate..');     
     String selDropdownVal=Apexpages.currentPage().getParameters().get('selStatus');
     String tableIdtoRender = Apexpages.currentPage().getParameters().get('renderTabId');
     String phone = Apexpages.currentPage().getParameters().get('phone');
     System.debug('..selDropdownVal...'+selDropdownVal+'..'+tableIdtoRender+'..'+phone);
     return null;
   }
}