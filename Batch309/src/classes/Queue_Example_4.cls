public class Queue_Example_4 implements Queueable {
    public void execute(QueueableContext qc){ // QueuableContext is a pre-defined interface ,which has getJobId() 
        List<Opportunity> opty=[select id from Opportunity where createdDate=TODAY];
        delete opty;
        Queue_Example_3 q=new Queue_Example_3();
		Id jobId=System.enqueueJob(q);
      
    }
}