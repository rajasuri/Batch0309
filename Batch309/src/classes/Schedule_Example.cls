/* Schedulable : 
 * 1. It is a interface 
 * 2. Apex class implememts this interface to run the logic at a particular time 
 * 3. Any class which is implementing this interface should define execute method .
 * 4. Execute method contains the logic that should be implemented 
 */
public class Schedule_Example implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Account> accounts =[select id from Account where rating='Hot'];
        for(Account a: accounts){
            a.rating='Warm';
        }
        update accounts;
    }
}