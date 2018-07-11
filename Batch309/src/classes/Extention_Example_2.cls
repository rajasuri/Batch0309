public class Extention_Example_2 {
    public List<Account> accounts {set;get;}
    public Extention_Example_2(Apexpages.StandardSetController controller){
       List<String> fields =new List<String>{'Name','Phone','Industry','Type'};
       controller.addFields(fields);
       accounts =(List<Account>) controller.getSelected(); 
    }
    public PageReference deleteData(){
        Database.delete(accounts,false);
        List<Account> accs =[select id from Account where isDeleted=true ALL ROWS];
        Database.emptyRecycleBin(accs);
        PageReference p=new PageReference('/001');
        return p;
    }
}