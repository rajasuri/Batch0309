public class Mixed_Example {
    public void create(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Student'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        // Create new user with a non-null user role ID 
        User u = new User(alias ='sm', email='abc@xyz.com', 
            emailencodingkey='UTF-8', lastname='kn', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='kiran@abc43.com');
        insert u;
       call();
    }
    @future
    public static void call(){
        Account acc=new Account();
        acc.Name='Testing';
        acc.Phone='1111';
        insert acc;
    }
}