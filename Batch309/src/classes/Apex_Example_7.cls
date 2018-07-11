global class Apex_Example_7 implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id ,name,rating from Account limit ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        for(Account a:scope){
            a.rating='Hot';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}