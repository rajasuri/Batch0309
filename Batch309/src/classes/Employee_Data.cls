public class Employee_Data {
    public String lastName 		{set;get;}
    public String firstName		{Set;get;}
    public Decimal exp			{set;get;}
    public Decimal salary		{set;get;}
    public Decimal bonus		{set;get;}
    public Employee_Data(){
        lastName='Myla';
        firstName='Satish';
        exp=3;
        salary=30000;
        bonus=45000;
    }
    public void invoke(){
        lastName='K';
        firstName='Satish';
        exp=10;
        salary=40000;
        bonus=34000;
    }
}