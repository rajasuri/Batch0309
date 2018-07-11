public class Component_Example {
    public List<String> accfields 	 {Set;get;}
    public List<String> conFields	 {Set;get;}
    public List<Account> accList     {set;get;}
    public List<Contact> conList	 {set;get;}
    public Component_Example(){
        accFields =new List<String>{'Name','Phone','Industry','Rating','Phone'};
        conFields =new List<String>{'LastName','FirstName','Phone','Email'};
        accList=[select Name,Phone,Industry,Rating from Account];
        conList=[select LastName,FirstName,Phone,Email from Contact];
    }
}