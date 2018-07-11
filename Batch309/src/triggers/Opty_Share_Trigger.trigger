/* When ever new record is inserted with stagename as closed won share the record with kiran */
trigger Opty_Share_Trigger on Opportunity (after insert) {
	List<OpportunityShare> share =new List<OpportunityShare>();
    User u=[select id from user where alias='Kiran'];
    for(Opportunity op:Trigger.new){
        if(op.stagename=='Closed Won'){
            OpportunityShare os=new OpportunityShare();
            os.OpportunityId=op.Id;
            os.UserOrGroupId=u.Id;
            os.OpportunityAccessLevel='Read';
            os.RowCause='Manual';
            share.add(os);
        }
    }
    insert share;
}