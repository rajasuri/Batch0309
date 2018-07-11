global class Schedule_Batch implements Database.Batchable<sobject>,Schedulable{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id,rating from Account';
        Database.QueryLocator result=Database.getQueryLocator(query);
        return result;
    }
    global void execute(Database.BatchableContext bc,List<Account> accounts){
        for(Account a: accounts){
            a.rating='Hot';
        }
        update accounts;
    }
    global void finish(Database.BatchableContext bc){
        
    }
    global  void execute(SchedulableContext sc){
         Schedule_Batch sb =new Schedule_Batch();
         Id jobId=Database.executeBatch(sb,300);
    }
}