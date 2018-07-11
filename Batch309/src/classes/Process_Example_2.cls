public class Process_Example_2 {
	@invocableMethod
    public static List<Id> getData(List<Id> accId){
     	List<Contact> contacts =[select id from Contact where accountId in :accId];
        List<Id> cons=new List<Id>();
        for(Contact c:contacts){
            cons.add(c.Id);
        }
        return cons;
    }
}