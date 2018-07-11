public class Account_List {
    public List<Account_Wrapper> accounts {set;get;}
    public Account_List(){
        List<Account> accList =[select Id,Name,Phone ,rating,industry from Account];
        accounts =new List<Account_Wrapper>();
        for(Account a : accList){
            Account_Wrapper aw =new Account_Wrapper();
            aw.acc=a;
            aw.flag=false;
            accounts.add(aw);
        }
    }
}