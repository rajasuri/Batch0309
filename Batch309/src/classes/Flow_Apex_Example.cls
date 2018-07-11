public class Flow_Apex_Example {
    public List<Account> accounts {set;get;}
    public List<Contact> contacts {set;get;}
    public Flow_Apex_Example(){
        accounts =[select id ,Name from Account where isDeleted=True and  createdDate=TODAY ALL ROWS];
        contacts =[select id ,LastName from Contact where isDeleted=true and createdDate=Today ALL ROWS];
    }
}