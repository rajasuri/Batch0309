public class SOQL_Example_2 {
    public List<Account> accounts {set;get;}
    public String query           {set;get;}
    public List<String> fields    {set;get;}
    public SOQL_Example_2(){
        fields=new List<String>{'Name','Phone','Industry','Rating','AnnualRevenue'};            
        query='select id';
        for(String s: fields ){
            query=query+','+s;  // query='select id'+','+Name ====> Select id,Name,Phone,Industry
        }
        query=query+' from Account';
        accounts=Database.query(query);
    }
}