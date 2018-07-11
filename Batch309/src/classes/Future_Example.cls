/* Future methods : 
 * 1. Any long running statements in the transactions will delay the operation .
 * 2. To avoid this delay we will be running long running statements independent 
 *    from rest of the transaction .
 * 3. To run this statements independently we will use  future methods 
 * 4. Rules define future methods 
 *     a. every future method should have @future annotation
 *     b. every future method is static 
 *     c. Future method will have return as void 
 *     d. Future method will not accept sobject as parameters .
 * 5. Any asynchronous operations which is running in the salesforce will be 
 *    registred with AsyncApexJob object 
 * 6. All the asynchronous operations will be added to queue ,from the queue job 
 *    will be running.
 */
public class Future_Example {
    @future
    public static void show(){
        System.debug('Show 1');
        System.debug('Show 2');
        System.debug('Show 3');
    }
    public void call(){
        System.debug('Call 1');
        System.debug('Call 2');
        System.debug('Call 3');
    }
    public void invoke(){
        System.debug('Invoke 1');
        System.debug('Invoke 2');
        System.debug('Invoke 3');
        show();
        System.debug('Invoke 4');
        System.debug('Invoke 5');
        System.debug('Invoke 6');
        call();
    }
}