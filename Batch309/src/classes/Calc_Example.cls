public class Calc_Example {
    public Integer aval {set;get;}
    public Integer bval {set;get;}
    public Integer cval {set;get;}
    public Integer dval {set;get;}
    public Integer eval	{set;get;}
    public String result {set;get;}
    public void add(){
        cval=aval+bval+dval+eval; 
        result='Sum of Aval,BVal:'+cval;
        
    }
}