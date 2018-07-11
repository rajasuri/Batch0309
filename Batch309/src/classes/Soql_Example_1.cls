public class Soql_Example_1 {
    public List<Account> accounts {set;get;}
    public Soql_Example_1(){
        // Static Query  : We know which fields and which object
        accounts =[select id,Name,Phone,Industry,Rating from Account];
       
    }
}