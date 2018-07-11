/* Changes made in one execute method will not be transfered to another execute method.
 * If you want the changes to be reflected in other executes then we have use Database.stateful interface.
 * When we use database.stateful interface ,Then state of only non-static variables will be transfered
 */
global class Batch_Example_4 implements Database.Batchable<Sobject>,Database.Stateful {
    global Integer count=0;
    global static Integer size=0;
    global String query ;
    global Batch_Example_4(String query){
        this.query=query;
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
         return Database.getQueryLocator(query);  
    }
    global void execute(Database.BatchableContext bc,List<Sobject> scope){
        for(Sobject s:scope){
            count=count+1;
            size=size+1;
        }
    }
    global void finish(Database.BatchableContext bc){
        Account acc =new Account();
        acc.Name='Count :'+count+'Size  :'+size;
        insert acc;
    }
}