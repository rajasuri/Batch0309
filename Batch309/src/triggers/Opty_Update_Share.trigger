trigger Opty_Update_Share on Opportunity (after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        OPty_Trigger_Handler.afterInsert(Trigger.new);
    }else{
        if(Trigger.isAfter && Trigger.isUpdate){
            OPty_Trigger_Handler.afterUpdate(Trigger.oldMap,Trigger.newMap);
        }
    }
	
}