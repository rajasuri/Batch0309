public class Sobject_Example_2 {
    public Account acc  	{set;get;}
    public Contact con  	{set;get;}
    public Opportunity opty {set;get;}
    public Sobject_Example_2(){
        acc=new Account();
        con=new Contact();
        opty=new Opportunity();
    }
}