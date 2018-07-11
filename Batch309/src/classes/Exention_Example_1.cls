public class Exention_Example_1 {
    // Any apex class which is defined as an extention should have a parameter Apexpages.StandardController 
    // or 
    // Apexpages.StandardSetController
    // 3r
    public Account acc {set;get;}
    public Exention_Example_1(Apexpages.StandardController controller){
        String[] fields =new String[]{'Name','Industry','Rating','Ownership','Phone','Type'};
        controller.addFields(fields);
        acc =(Account) controller.getRecord();	
    }
    public PageReference save(){
        Integer count =[select count() from Account where name=:acc.Name];
        if(count> 0){
          Apexpages.Message msg =new Apexpages.message(Apexpages.Severity.Error,'Duplicate record Exists');
          Apexpages.addMessage(msg);
          return null;
        }else{
            insert acc;
            pageReference p=new PageReference('/'+acc.Id);
            return p;
        }
    }
}