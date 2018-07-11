public class SOQL_Dynamic_Example {
    public String accName           {set;get;}
    public String accIndustry       {set;get;}
    public List<Account> accounts   {set;get;}
    public void search(){
        String query='select Name,Phone,Industry,rating from Account';
        if(accName!='' && accIndustry!=''){
            query=query+' where name=\''+accName+'\' and Industry=\''+accIndustry+'\'';
        }else{		 
            if(accName!=''){
                query=query+' where name=\''+accName+'\'';
            }else{
                if(accIndustry!=''){
                    query=query+' where industry=\''+accIndustry+'\'';
                }
            }
        }
        accounts=Database.query(query);
    }
}