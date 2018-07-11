@isTest
public class Test_Data {
    public static List<Account> callMe(){
        List<Account> accounts =new List<Account>();
        Account acc=new Account();
        acc.Name='Testing';
        acc.Phone='111';
        acc.Industry='Banking';
        accounts.add(acc);
        Account ac=new Account();
        ac.Name='Wipro';
        ac.Phone='222';
        ac.Industry='Energy';
        accounts.add(ac);
        insert accounts;
        return accounts;
    }
}