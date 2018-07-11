/* When ever a new Account is created set rating as warm
 * type as prospect 
 * Active as false 
 */
trigger Account_Example_1 on Account (before insert) {
    for(Account a: Trigger.New){
        a.rating='Warm';
        a.Type='Prospect';
        a.Active__c='false';
    }   
}
/* When ever new Oppportunity is created then set stageName as Prospect ,closeDate as 15 days from today, type as New Customer
 */