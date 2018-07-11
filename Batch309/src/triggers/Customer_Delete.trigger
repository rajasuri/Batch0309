trigger Customer_Delete on Customer__c (before delete) {
    Customer_Trigger_Handler.beforeDelete(Trigger.old);
}