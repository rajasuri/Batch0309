public class CommandButton_Example_1 {
    public String name 			{set;get;}
    public Integer age 			{set;get;}
    public Decimal salary 		{set;get;}
    public Decimal bonus		{set;get;}
    public CommandButton_Example_1(){
        name='Satish';
        age=33;
    }
    public void invoke(){
        salary=40000;
        bonus=2000;
    }
}