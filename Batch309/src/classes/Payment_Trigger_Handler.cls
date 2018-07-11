public class Payment_Trigger_Handler {
    public static void afterInsert(List<Payment__c> payments){
        Map<Id,List<Payment__c> > customerMap =helper(payments);
        /* Fetch all the customer records whose id's are in the customerMap as key */
        List<Customer__C> customers=[select id ,Total__C from Customer__C where id in :CustomerMap.keySet()];
        for(Customer__C c: customers){
            /* Based on the customerId fetch the corresponding payments */
            List<Payment__C> pays =customerMap.get(c.id);
            for(Payment__c p: pays){
                c.Total__c =c.total__c+p.Amount__c;
            }
        }
        update customers;
    }
    public static void beforeDelete(List<Payment__c> payments){
      
        Map<Id,List<Payment__c> > customerMap =helper(payments);
        /* Fetch all the customer records whose id's are in the customerMap as key */
        List<Customer__C> customers=[select id ,Total__C from Customer__C where id in :CustomerMap.keySet()];
        for(Customer__C c: customers){
            /* Based on the customerId fetch the corresponding payments */
            List<Payment__C> pays =customerMap.get(c.id);
            for(Payment__c p: pays){
                c.Total__c =c.total__c-p.Amount__c;
            }
        }
        update customers;  
    }
    
    public static void afterUpdate(Map<Id,Payment__c> oldMap ,Map<Id,Payment__c> newMap){
        List<Payment__c> payments =newMap.values();
        Map<Id,List<Payment__C> > customerMap =helper(payments);
         List<Customer__C> customers=[select id ,Total__C from Customer__C where id in :CustomerMap.keySet()];
         for(Customer__C c: customers){
             	List<Payment__c> pays =customerMap.get(c.id);
            	 for(Payment__C p: pays ){
                 	Payment__C old =oldMap.get(p.id);
                     if(old.Amount__C < p.Amount__c){
                         c.Total__C =c.Total__C+(p.Amount__c-old.Amount__c);
                     }else{
                         if(old.Amount__c > p.Amount__c){
                             c.Total__c=c.Total__c-(Old.Amount__c-p.Amount__c);
                         }
                     }
             	  }
         }
        update customers;
    }    
    public static Map<Id,List<Payment__c>> helper(List<Payment__C> payments){
         /* Create a Map with customer Id as key and List of payment records as value */
        Map<Id,List<Payment__c> > customerMap =new Map<Id,List<Payment__c>>();
        for(Payment__c p: payments){
            /* Check whether customerId is  available as key in the map .
             * If it available then fetch the existing value and add new payment to the list 
             * put back the map
             */
            if(customerMap.containskey(p.customer__c)){
                List<Payment__c> pays=customerMap.get(p.customer__c);
                pays.add(p);
                customerMap.put(p.customer__c,pays);
            }else{
                List<Payment__c> pays=new List<Payment__c>();
                pays.add(p);
                customerMap.put(p.customer__c,pays);
            }
        }
        return customerMap;
      
    }
}