public class Inbound_Example_2 implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result =new Messaging.InboundEmailResult();
        try{
            String fromAd=email.fromAddress;
            Contact con=[select id from Contact where email=:fromAd];
            Case c=new Case();
            c.Subject=email.subject;
            c.Description=email.plainTextBody;
            c.contactId=con.id;
            c.priority='High';
            c.Origin='Email';
            insert c;
            /* Get all the attachments we have received from the inbound */
            Messaging.InboundEmail.binaryAttachment[] files =email.binaryAttachments;
            List<Attachment> myFiles =new List<Attachment>();
            // Take one by one files from the binaryAttachment and create attachment 
            for(Messaging.InboundEmail.BinaryAttachment m:files){
                Attachment a =new Attachment();
                a.parentId=c.Id;
                a.Name=m.FileName;
                a.body=m.body;
                myFiles.add(a);
            }
            insert myFiles;
            result.success=true;
        }catch(Exception e){
            result.success=false;
        }
        return result;
    }

}