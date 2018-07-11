/*Sobject: salesforce object 
 * Any object created in the database of salesforce is reffered using sobject 
 * Every sobject has equilent apex class 
 * Sobject 			Apex class 
 * Account 			Account
 * Contact 			Contact
 * Customer__c		Customer__c
 */
public class Sobject_Message_Example1 {
    public Account acc {set;get;}
    public Sobject_Message_Example1(){
        acc=new Account();
    }
    public void create(){
        if(acc.Phone ==''|| acc.Phone==null ){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'Phone number cannot be blank');
            Apexpages.addMessage(msg);
        }
        if(acc.AnnualRevenue == null){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'AnnualReveue cannot be zero');
            Apexpages.addMessage(msg);
        }
    }
}