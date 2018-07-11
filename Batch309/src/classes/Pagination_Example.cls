public class Pagination_Example {
    public ApexPages.StandardSetController controller {set;get;}
    public List<Opportunity> getOpty(){
      	List<Opportunity> optyList =(List<Opportunity>)controller.getRecords();
        return optyList;
    }
    public Pagination_Example(){
        List<opportunity> optyList =[select id,name,stagename,closeDate from Opportunity];
        controller=new Apexpages.StandardSetController(optyList);
        controller.setPageSize(5);
    }
}