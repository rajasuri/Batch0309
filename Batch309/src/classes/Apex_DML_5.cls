public class Apex_DML_5 {
	public String accName;
    public String phone;
    public String rating;
    public void create(){
        Account acc =new Account();
        acc.Name=accName;
        acc.Phone=phone;
        acc.rating=rating;
        insert acc;
    }
    public void delData(){
        List<Account> accounts =[select id from Account where createdDate=TODAY];
        delete accounts;
    }
}