trigger Payment_Triggers on Payment__c (after insert, after update ,after delete ,after undelete) {
    if(Trigger.isInsert || Trigger.isUndelete){
        Payment_Trigger_Handler.afterInsert(Trigger.new);
    }else{
        if(Trigger.isUpdate){
            Payment_Trigger_Handler.afterUpdate(Trigger.oldMap,Trigger.newMap);
        }else{
            Payment_Trigger_Handler.beforeDelete(Trigger.old);
        }
    }
    
}