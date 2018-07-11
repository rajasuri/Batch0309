/* 
 * Fetch All the records from the opportunity  and update their deails 
 */

global class Batch_Example_2 implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id,name,stagename,closeDate,type from Opportunity where createdDate=TODAY';
        Database.QueryLocator result=Database.getQueryLocator(query);
        return result;
    }
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        for(Opportunity op:scope){
            op.closeDate=System.today()+15;
            op.stageName='Prospect';
            op.type='New Customer';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}