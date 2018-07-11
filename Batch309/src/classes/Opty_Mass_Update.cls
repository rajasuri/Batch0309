public class Opty_Mass_Update {
    public List<Opportunity> optyData {set;get;}
    public Opty_Mass_Update(Apexpages.StandardSetController controller){
        List<String> fields =new List<String>{'Name','StageName','CloseDate','Amount'};
        controller.addFields(fields);
        optyData =(List<Opportunity>)controller.getSelected();
    }
    public PageReference updateData(){
        for(Opportunity op:optyData){
            op.stageName='Closed Won';
        }
        update optyData;
        PageReference p=new PageReference('/006');
        return p;
    }
}