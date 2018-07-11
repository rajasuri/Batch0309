public class Apex_Example_8 implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Account> accounts =[select id from Account where createdDate=TODAY];
        delete accounts;
    }
}