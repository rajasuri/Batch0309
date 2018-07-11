global class Batch_Example_1 implements Database.Batchable<sobject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id,rating,ownership from Account ';
        return Database.getQueryLocator(query);

    }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        for(Account a:scope){
            a.rating='Hot';
            a.ownership='Public';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job=[SELECT JobItemsProcessed,JobType,Status,TotalJobItems FROM AsyncApexJob where Id=:bc.getJobId()];
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        String[] toadd=new String[]{'salsforcebatch300@gmail.com'};
        msg.setToAddresses(toadd);
        msg.setSubject('Status Alert');
        String body='Status: '+job.status;
        body=body+'Jobs Process :'+job.JobItemsProcessed;
        body=body+'TotalJobItems:'+job.TotalJobItems;
        msg.setPlainTextBody(body);
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);    
    }
}