public class Outbound_Single_Email_Example_1 {
    /* Fetch all the contcts whose phone number is 9876 and send email to them with corresponding body
     * Dear Customer ,
     * Plese update your Contact details ,Current Details are 
     * Last Name : Myla
     * First Name : Satish
     * Phone   : 9876
     * Thanks
     * Sales Teams
     */
    public void invoke(){
        List<Contact> contacts =[select id,email from Contact where phone='9876'];
        List<String> toadd=new List<String>();
        for(Contact c:contacts){
            toadd.add(c.email);
        }
        Messaging.SingleEmailMessage msg1 =new Messaging.SingleEmailMessage();
        msg1.setToAddresses(toadd);
        msg1.setSubject('Test Email');
        msg1.setPlainTextBody('This is a test email from apex');
        msg1.setSenderDisplayName('Kiran');
        Messaging.Email[] emails =new Messaging.Email[]{msg1};
        Messaging.sendEmail(emails);
    }
    public void call(){
        List<Contact> contacts =[select id,email,lastName,firstName,Phone from Contact where phone='9876'];
        List<Messaging.SingleEmailMessage> emails =new List<Messaging.SingleEmailMessage>();
        for(Contact c: contacts){
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            String[] toadd=new String[]{c.email};
            msg.setToAddresses(toadd);
            msg.setSubject('Stay in Touch');
            String body='Dear Customer <br/> ';
            body=body+'Please update your contact details in case of changes .Current Details are <br/>';
            body=body+'First Name :<font style="color:red;">'+c.FirstName+' </font><br/>';
            body=body+'Last Name :<font style="color:red;">'+c.LastName+' </font><br/>';
            body=body+'Phone :<font style="color:red;">'+c.Phone+' </font> <br/>';
            body=body+'<br/> Thanks<br/> Sales Team';
            msg.setHtmlBody(body);
            msg.setSenderDisplayName('CapitalGroup');
            emails.add(msg);
            
        }
        Messaging.sendEmail(emails);
    }
    public void  sendFiles(){ 
        /* Fetch the attachment from the Document object */
        Document d =[select id ,name,body from Document where name='Map'];
        /* Create a EmailFileAttachment */
        Messaging.EmailFileAttachment eft1 =new Messaging.EmailFileAttachment();
        eft1.setFileName(d.name+'.txt');
        eft1.setBody(d.body);
        /* Convert the VF page as PDF and create a attachment */
        PageReference p=Page.InvoicePage;
        /* Convert the page into binary */
          Blob body=p.getContentAsPDF(); 
        Messaging.EmailFileAttachment eft2 =new Messaging.EmailFileAttachment();
        eft2.setFileName('Invoice.pdf');
        eft2.setBody(body);
        /* Put all the attachments in a list */
        List<Messaging.EmailFileAttachment> files =new List<Messaging.EmailFileAttachment>{eft1,eft2};
        Contact c=[select id,email from Contact where phone='9876'];
        String[] toad=new String[]{c.email};
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(toad);
        msg.setSubject('Test Email');
        msg.setPlainTextBody('Email with some attachments');
        msg.setFileAttachments(files);
        Messaging.Email[] emails=new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
    public void  sendAndAttach(){
        /* Fetch the attachment from the Document object */
        Document d =[select id ,name,body from Document where name='Map'];
        /* Create a EmailFileAttachment */
        Messaging.EmailFileAttachment eft1 =new Messaging.EmailFileAttachment();
        eft1.setFileName(d.name+'.txt');
        eft1.setBody(d.body);
        /* Convert the VF page as PDF and create a attachment */
        PageReference p=Page.InvoicePage; // Page is predefined class , Invoicepage name of vfpage 
        /* Convert the page into binary */
          Blob body=p.getContentAsPDF(); // Converting the body of the page in the form blob
        Messaging.EmailFileAttachment eft2 =new Messaging.EmailFileAttachment();
        eft2.setFileName('Invoice.pdf');
        eft2.setBody(body);
        /* Put all the attachments in a list */
        List<Messaging.EmailFileAttachment> files =new List<Messaging.EmailFileAttachment>{eft1,eft2};
        Contact c=[select id,email from Contact where phone='9876'];
        String[] toad=new String[]{c.email};
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(toad);
        msg.setSubject('Test Email');
        msg.setPlainTextBody('Email with some attachments');
        msg.setFileAttachments(files);
        Messaging.Email[] emails=new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
        Attachment at1 =new Attachment();
        at1.ParentId=c.Id;
        at1.Name='MapNotes';
        at1.body=d.body;
        Attachment at2 =new Attachment();
        at2.ParentId=c.Id;
        at2.Name='Invoice';
        at2.body=body;
        List<Attachment> myfiles =new List<Attachment>{at1,at2};
        insert myfiles;
    }
    /* We can send EmailTemplate only to Lead,Contact,User 
     * In case if you are sending emailTemplate to contact then we can pass Id of the record whose data need to be used
     * in the Template 
     * 
     * setTargetObjectId(Id) : This can be Id of the user ,contact,Lead to whom you want to send email
     * setWhatId(Id) : This will take the Id of the record whoes data need to be used in the template
     */
    public void sendTemp(){
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        /* Fetch the Id of the contact to whom you want to send email */
        Contact c=[select id ,accountId from Contact where phone='9876'];
        msg.setTargetObjectId(c.Id);
        /* Which record data we want to pass */
      msg.setWhatId(c.accountId);
        /* Which email template we want to send */
        EmailTemplate et =[select id from EmailTemplate where name='Testing'];
        msg.setTemplateId(et.id);
        Messaging.Email[] email =new Messaging.Email[]{msg};
        Messaging.sendEmail(email);
    }
    public void sendMassTemp(){
        Messaging.MassEmailMessage msg =new Messaging.MassEmailMessage();
        /* Fetch the Id of the contact to whom you want to send email */
        Map<Id,Contact> conMap=new Map<Id,Contact>([select id ,accountId from Contact where phone='9876']);
        Set<Id> keys =conMap.keySet();
        List<Id> values =new List<Id>(keys);
        msg.setTargetObjectIds(values);
        /* Which record data we want to pass */
        //msg.setWhatId(c.accountId);
        /* Which email template we want to send */
        EmailTemplate et =[select id from EmailTemplate where name='Testing'];
        msg.setTemplateId(et.id);
        Messaging.Email[] email =new Messaging.Email[]{msg};
        Messaging.sendEmail(email); 
    }  
}