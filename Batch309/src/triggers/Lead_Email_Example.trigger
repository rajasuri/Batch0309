trigger Lead_Email_Example on Lead (after insert) {
    /* Every User Has Manager  :FieldName : Manager :
     * Becuase it is a standard lookup fields we need to embeed Id after field Name : ManagerId
     *Step 1 : Get the Id's of all the owners of the new Lead Records 
    */
     List<Id> owners =new List<Id>();
     for(Lead l:Trigger.new){
        owners.add(l.ownerId);  
     }
     System.debug('Owner Ids:'+owners);
     /* Write a query to fetch all the Managers of given owner's */
     List<User> managers =[select id ,ManagerId from User where id in:owners];
     /* Create a Map with user as key and corresponding manager as value */
     Map<Id,Id> userMap=new Map<Id,Id>();
     for(User u:managers){
        userMap.put(u.Id,u.ManagerId); 
     }
    /* Get the list of all the managers from the map */
    List<Id> managerList =userMap.values();
     /* Get the emails of the managers */
    List<User>  users =[select id,email from User where id in:managerList];
    /* Create Map with user Id as key and email as value */
    Map<Id,String> managerMap=new Map<Id,String>();
    for(User u:users){
        managerMap.put(u.id,u.email);
    }
    List<Messaging.SingleEmailMessage> messages =new List<Messaging.SingleEmailMessage>();
    for(Lead my:Trigger.new){
        // Get the Id of the manager based on ownerId 
        Id man=userMap.get(my.ownerId);
        // Get the email of the manager based on userId
        String email=managerMap.get(man);
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(new String[]{email});
        msg.setSubject('Notification');
        String body='Dear Manager,<br/>';
        body=body+'Last Name :'+my.LastName;
        body=body+'<br/>First Name:'+my.FirstName;
        body=body+'<br/> Phone :'+my.Phone;
        msg.setHtmlBody(body);
        messages.add(msg);
    }
    Messaging.sendEmail(messages);
}