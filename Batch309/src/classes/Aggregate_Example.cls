/* AggregateFunctions: 
 * 1. count() :  This will return count of no of records returned by the soql.
 * Integer size =[select count() from Account where industry='Banking'];
 * 
 * 2.count(fields): This will return you count of no of records which doesnt have the given field values as not null;
 * 	  AggregateResult result=[select count(Name),Count(Amount) from Opportunity];
 * 
 * 3.Sum(Fields) : This will return the summarized value of given field from the queryResult
 * 	AggregateResult result =[selec sum(amount) from Opportunity];
 * 
 * 4. Avg(field): This will return the average value of given field from the queryResult
 * 		AggregateResult result =[select avg(Amount) from Opportunity ];
 * 
 * 5. max(field) : This will return the maximum value of given field from the queryResult
 * 		AggregateResult result=[select max(amount) from Opportunity];
 * 
 * 6. min(field) : This will return the minimum value of given field from the queryResult
 * 		AggregateResult result =[select min(amount) from Opportunity];
 * 		
 * 		DataType value=(DataType)result.get(key);
 * 		Decimal amount=(Decimal)result.get(expr0);
 *     Integer  :  
 * 	   String   : 
 * 	   Decimal  : 
 * 	   Object   :
 * 		Integer age=(Integer)objectValue;
 * 		Decimal salary=(Decimal)objectValue;
 * 		
 */ 		
public class Aggregate_Example {
    public Aggregate_Example(){
        AggregateResult result=[select sum(amount)amt, max(amount)maxval,min(amount)minval from Opportunity];
        system.debug('====='+result);
        Decimal amount=(Decimal)result.get('amt');
        Decimal maxval=(Decimal)result.get('maxval');
        Decimal minval=(Decimal)result.get('minval');
        System.debug('Amount : '+amount);
        System.debug('MaxValue:'+maxval);
        System.debug('Minvalue:'+minval);
    }
    public void groupExample(){
         List<AggregateResult> myList=[select stageName,sum(amount)amt, max(amount)maxval,min(amount)minval from Opportunity group by StageName];
        system.debug('===='+myList);
        
        for(AggregateResult rs: myList){
           String stage=(String)rs.get('stagename');
           System.debug('======>>>>'+stage);
           Decimal amt =(Decimal)rs.get('amt');
           Decimal maxval=(Decimal)rs.get('maxval');
           Decimal minval=(Decimal)rs.get('minval');
           System.debug('Amount : '+amt);
           System.debug('MaxValue:'+maxval);
           System.debug('Minvalue:'+minval);
            
        }
        
    }
}