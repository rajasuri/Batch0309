public class Employee_Calculation {
    public String name 		{set;get;}
    public String selected  {set;get;}
    public Integer exp		{set;get;}
    public Decimal salary	{Set;get;}
    public Decimal bonus	{set;get;}
    public void calculate(){
        if(selected=='Hyd' && exp > 3){
            salary=50000;
            bonus=5000;
        }else{
            salary=30000;
            bonus=3000;
        }
    }
    public void reset(){
        name=null;
        selected=null;
        exp=null;
        salary=null;
        bonus=null;
    }
}