public class Mass_Email_Alerts {
    public Account acc {set;get;}
    public List<Contact> contacts {Set;get;}
    public Mass_Email_Alerts(Apexpages.StandardController controller){
        List<String> fields =new List<String>{'Name','Phone','Industry','rating'};
         controller.addFields(fields);
          acc =(Account)controller.getRecord();
        contacts =[select id ,email,lastname,firstname from Contact where accountId=:acc.Id];
    }
    public void sendAlert(){
        
        List<String> toEmails =new List<String>();
        for(Contact c:contacts){
            toEmails.add(c.email);
        }
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(toEmails);
        msg.setSubject('Update Contact Details');
        msg.setPlainTextBody('Test Message');
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}