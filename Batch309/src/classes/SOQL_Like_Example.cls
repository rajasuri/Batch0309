public class SOQL_Like_Example {
    public String searchText 		{set;get;}
    public List<Account> accounts 	{set;get;}
    public String query				{set;get;}
    public void search(){
         query='select name,industry,phone,rating from Account where name like \'%'+searchText+'%\'';
         accounts =Database.query(query);
    }
}