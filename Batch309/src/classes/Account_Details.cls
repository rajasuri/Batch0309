public class Account_Details {
    public List<Parent_Childwrapper> actlist{set;get;} 
    public Account_Details(){
      List<Account>accs=[select name,phone,industry,(select firstname,lastname from Contacts)from Account];
        actlist=new List<Parent_Childwrapper>();
        for(Account a:accs){
         Parent_Childwrapper pc=new Parent_Childwrapper();
            pc.acc=a;
            pc.con=a.contacts;
            actlist.add(pc);
        }
    }

}