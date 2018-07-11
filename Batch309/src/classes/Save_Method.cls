public class Save_Method {
    public Decimal amount {set;get;}
    public Decimal rate	  {set;get;}
    public Decimal years  {set;get;}
    public Decimal intrest{set;get;}
    public void calculate(){
       intrest=(amount*rate*years)/100;
    }
    public void save(){
        amount=null;
        rate=null;
        years=null;
        intrest=null;
    }

}