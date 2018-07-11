public class Action_Pooler_Example {
    public Integer count {set;get;}
    public String message {Set;get;}
    public Action_Pooler_Example(){
        count=1;
        message ='Current Time :'+System.now()+' : Count :'+count;
    }
    public void show(){
         count=count+1;
        message ='Current Time :'+System.now()+' : Count :'+count;
    }
}