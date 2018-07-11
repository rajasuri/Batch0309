/* 
 * InboundEmailHandler: 
 * 1. it is a interface .
 * 2. It is defined in Messaging namespace.
 * 3. Any class which want to hanlde the email received from external system,has to implement this interface 
 * 4. Any class which is implementing InboundEmailHandler interface has to define a method : handleInboundEmail
 *    Syntax : 
 *    Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env)
 * InboundEmailResult :
 *  1. It is a pre-define apex class .
 *  2. This is defined in the Messaging namespace.
 *  3. This class will contain the status of the email handled 
 *  4. This class contain the boolen variable success .
 *  5. If the email is handled properly then success=true;
 *  6. If the email is non-handled properly then success=false;
 * 
 * InboundEmail : 
 * 1. It is predefined apex class .
 * 2. This class contains the email recevied from the external system
 * 3. Example : 
 *      fromName 
 *      toAddress
 *      ccAddress
 *      plainTextBody
 *      subject 
 *      Etc....
 * 
 * InboundEnvelope :
 * 1. It is a predefined Apex class .
 * 2. This class contains the toAddress and fromAddress  of the email received
 */  
 
public class Inbound_Example_1 implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email ,Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result =new Messaging.InboundEmailResult();
        try{
            Case c=new Case();
            c.subject=email.subject;
            c.Description=email.plainTextBody;
            String fromAd=email.fromAddress;
            Contact con=[select id from Contact where email=:fromAd];
            c.ContactId=con.Id;
            c.Priority='High';
            c.Status='New';
            c.Origin='Email';
            insert c;
            result.success=true;
        }catch(Exception e){
            result.success=false;
        }
        return result;
    }
}