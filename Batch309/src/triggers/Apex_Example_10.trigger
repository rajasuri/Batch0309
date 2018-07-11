trigger Apex_Example_10 on Lead (after insert) {
	List<Contact> contacts =new List<Contact>();
    for(Lead l :Trigger.new){
        Contact c=new Contact();
        c.LastName=l.LastName;
        c.FirstName=l.firstName;
        c.Phone=l.phone;
        contacts.add(c);
    }
    insert contacts;
}