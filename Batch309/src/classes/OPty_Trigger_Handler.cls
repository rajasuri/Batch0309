public class OPty_Trigger_Handler {
    /* If the stagename is modified to closed won share the record with kiran */
    public static void afterUpdate(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap){
         /* Fetch the Id of the user kiran */
        User u =[select id from User where alias='Kiran'];
        List<OpportunityShare> optyList=new List<OpportunityShare>();
        /* Check weather stagename is modified to closed won */
        Set<Id> keys =oldMap.keySet();
        for(Id k : keys ){
            Opportunity old=oldMap.get(k);
            Opportunity newOpt=newMap.get(k);
            if(old.stagename!='Closed won' && newopt.stagename=='Closed Won'){
                OpportunityShare share =new OpportunityShare();
                share.opportunityId=k;
                share.UserOrGroupId=u.id;
                share.OpportunityAccessLevel='Edit';
                share.RowCause='Manual';
                optyList.add(share);
            }
        }
        insert optyList;
    }
    public static void afterInsert(List<Opportunity> optyList){
        List<OpportunityTeamMember> teams =new List<OpportunityTeamMember>();
        User u =[select id from User where alias='SM'];
        for(Opportunity op: optyList){
            if(op.type=='New Customer'){
                OpportunityTeamMember otm =new OpportunityTeamMember();
                otm.OpportunityId=op.Id;
                otm.UserId=u.id;
                otm.TeamMemberRole='Account Manager';
                otm.OpportunityAccessLevel='Edit';
                teams.add(otm);
                    
            }
        }
        insert teams;
    }
}