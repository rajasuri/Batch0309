public class Account_Trigger_Handler {
    public static void afterUpdate(Map<Id,Account> oldMap,Map<Id,Account> newMap){
        Set<Id> keys =oldMap.keySet();
        List<Id> accounts=new List<Id>();
        //Fetch Id's of those Accounts whose phone numbers are modified.
        for(Id k :keys){
            Account oldAcc=oldMap.get(k);
            Account newAcc=newMap.get(k);
            if(oldAcc.Phone!=newAcc.Phone){
                accounts.add(k);
            }
        }
        // Fetch contacts of those accounts whose id are in  above fetched list
        List<Contact> contacts =[select id ,otherphone from Contact where accountId=:accounts];
        for(Contact c:contacts){
            Account acc=oldMap.get(c.accountId);
            String phone =acc.phone;
            c.otherphone=phone;
        }
        update contacts;
    }
}