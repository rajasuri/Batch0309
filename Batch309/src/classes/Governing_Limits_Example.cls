/* Governing Limits 
 * Salesforce to obey Multi-Tenant System, it has implemented Governing Limits 
 * Every Transaction should obey these rules
 *  1, Maximimum 100 soql in a transaction
 *  2. Maximim 150 DML statements 
 *  3. Maximum 10000 records in a transaction
 *  4. Batch apex 5 jobs 
 *  5. Future  methods 50 
 *  6. Queuable methods :50 
 *  7. Webservice callouts :100
 *  8. SOSL  :20
 *  9. SOQL query will return 50,000 records.

 */

public class Governing_Limits_Example {
    public void soql_Limits(){
        List<Account> accounts =[select id from Account]; // One query 
        List<Contact> contacts=[select id from Contact]; // one query
        call();
        invoke();
    }
    public void call(){
        for(Integer i=1;i<=50;i++){
            List<Opportunity> opty=[select id from Opportunity];    // 50 queries 
        }
    }
    public void invoke(){
        for(Integer i=1;i<=50;i++){
            List<Case> cases =[select id,subject from Case];
        }
    }
    public void dml_limits(){
         Account acc=new Account(Name='Testing',Industry='Banking');
        insert acc; // one dml
        update acc; // one dml
        delete acc;// one dml
        undelete acc;// one dml
        for(Integer i=1;i<=150;i++){
            Contact c=new Contact();
            c.LastName='Testing';
            insert c;
        }  
        dmlcall();
    }
    public void dmlcall(){
        for(Integer i=1;i<=100;i++){
            Lead l=new Lead();
            l.lastName='k';
            l.company='SFDC';
            insert l;
        }
    }
    public void dmlrows(){
       Lead l=new Lead();
       l.lastName='k';
       l.company='SFDC';
       insert l;
       update l;
       delete l;
        List<Account> accounts =new List<Account>();
        for(Integer i=1;i<=10000;i++){
            Account a=new Account();
            a.Name='Testing';
            a.Phone='1111';
            accounts.add(a);
        }
        insert accounts;
    }
}