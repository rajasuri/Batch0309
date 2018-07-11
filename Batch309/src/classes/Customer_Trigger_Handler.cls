public class Customer_Trigger_Handler {
    public static void beforeDelete(List<Customer__c> customers){
        /* Fetch all those customers who are in-active */
        List<Id> custIds=new List<Id>();
        for(Customer__c c: customers){
            if(c.Active__c ==true ){
                custIds.add(c.Id);
            }
        }
        List<Payment__C> payments=[select id from Payment__c where Customer__c in: custIds];
        delete payments;
    }
}