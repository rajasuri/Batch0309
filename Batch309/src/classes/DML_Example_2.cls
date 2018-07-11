public class DML_Example_2 {
    public Account acc          {set;get;}
    public Contact con          {set;get;}
    public Opportunity opty     {set;get;}
    public DML_Example_2(){
        acc=new Account();
        con=new Contact();
        opty=new Opportunity();
    }
    public PageReference create(){
        // Insert account 
        insert acc;
        // Create a contact for above account
        con.accountId=acc.Id;
        insert con;
        // Create a opportuity for above account
        opty.accountId=acc.Id;
        insert opty;
        // Return to the detail page of the account
        PageReference p=new PageReference('/'+acc.Id);
        return p;
    }
    public void reset(){
        acc=new Account();
        con=new Contact();
        opty=new Opportunity();
    }
}