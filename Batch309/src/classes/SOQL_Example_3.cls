public class SOQL_Example_3 {
    public List<Account> accounts {set;get;}
    public SOQL_Example_3(){
        accounts =[select Name,Phone,Industry,Rating from Account];
    }
    public void fixed_Offset(){
        accounts=[select Name,Phone,Industry,Rating from Account offset 5];
    }
    public void dynamic_Offset(){
        Integer size=4;
        accounts=[select Name,Phone,Industry,Rating from Account offset :size];
    }
    public void fixed_Limit(){
        accounts =[select Name,Phone,Industry,Rating from Account Limit 5];
    }
    public void dynamic_Limit(){
        Integer size=3;
        accounts=[select Name,Phone,Industry,Rating from Account limit:size];
    }
    public void limit_offset(){
         Integer size=5;
         accounts=[select Name,Phone,Industry,Rating from Account limit:size offset:size];
    }
}