public class Schedule_Example_2 implements Schedulable{
    public void execute(SchedulableContext sc){
         List<Lead> leads =[select id,rating from Lead where rating='Hot' and createdDate=THIS_MONTH];
         for(Lead l:leads){
          	l.rating='Warm';  
         }
        update leads;
    }
}