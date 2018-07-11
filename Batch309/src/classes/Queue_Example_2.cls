public class Queue_Example_2 implements Queueable {
    public void execute(QueueableContext qc){ // QueuableContext is a pre-defined interface ,which has getJobId() 
        List<Opportunity> opty=[select id from Opportunity where createdDate=TODAY];
        delete opty;
        Queue_Example_1 q=new Queue_Example_1();
		Id jobId=System.enqueueJob(q);
      
    }
}
// Queue_Example_2 q=new Queue_Example_2();
// Id jobId=System.enqueueJob(q);