/* 
 * Delete all the contacts of those accounts which created in last 45 days .
 */
global class Batch_Example_3 implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query ='select id,name from Account where createdDate=LAST_N_DAYS:45';
        Database.QueryLocator result=Database.getQueryLocator(query);
        return result;
    }
    global void execute(Database.BatchableContext bc,List<Account> accounts){
        List<Contact> contacts =[select id from Contact where accountId in:accounts];
        delete contacts;
         Queue_Example_2 q=new Queue_Example_2();
        Id jobId=System.enqueueJob(q);
    }
    global void finish(Database.BatchableContext bc){
        Queue_Example_2 q=new Queue_Example_2();
        Id jobId=System.enqueueJob(q);
    }
}