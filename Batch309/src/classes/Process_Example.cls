public class Process_Example {
	@invocableMethod
    public static void callMe(List<Id> accIds){
        List<Contact> contacts=[select id,otherphone from contact where accountId=:accIds];
        for(Contact c:contacts){
            c.otherPhone='12345';
        }
        update contacts;
        
    }
}