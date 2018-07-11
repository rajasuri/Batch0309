public class SOSL_Example {
    public List<Account> accounts 		{set;get;}
    public List<Contact> contacts 		{set;get;}
    public List<Opportunity> optyList 	{set;get;}
    public SOSL_Example(){
        List<List<Sobject>> result =[FIND 'satish' IN ALL FIELDS Returning Account(Name,Phone,Industry where industry='Banking'),Contact(LastName,FirstName,Phone limit 1),Opportunity(name,stagename,closeDate)];
    	accounts=(List<Account>)result[0];
        contacts=(List<Contact>)result[1];
        optyList=(List<Opportunity>)result[2];
    }
}