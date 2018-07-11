public class DML_Example_1 {
    public Account acc {set;get;}
    public DML_Example_1(){
        acc=new Account();
        
    }
    public PageReference create(){
        /* List<Account> accounts =[select id from Account where name=:acc.Name];
        if(accounts.size()>0) */
        // Check are there any accounts in the object with the name Wipro
        Integer count =[select count() from Account where name=:acc.Name];
        // If the count is more than zero there are some duplicate records.
        if(count> 0){
            // If any duplicate records is there then thow error messagees
            Apexpages.Message msg =new ApexPages.Message(Apexpages.Severity.Error,'Duplicate record Exists');
            Apexpages.addMessage(msg);
            return null;
        }else{
                insert acc;// If there are no duplicate record ,thorw error message 
                PageReference p=new PageReference('/'+acc.Id);
                return p;
        }
    }
}