trigger Account_Phone_Trigger on Account (after Update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        Account_Trigger_Handler.afterUpdate(Trigger.oldMap,Trigger.newMap);
    }
}