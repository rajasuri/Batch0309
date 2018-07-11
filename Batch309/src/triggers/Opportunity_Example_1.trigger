trigger Opportunity_Example_1 on Opportunity (before insert) {
    for(Opportunity op:Trigger.New){
        op.stageName='Prospect';
        op.closeDate=System.today()+15;
        op.Type='New Customer';
        op.leadSource='web';
    }
}