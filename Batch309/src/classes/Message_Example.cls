/* Message : 
 * 1. It is a predefined apex class .
 * 2. it is defined under the namespace of Apexpages
 * 3. This class is used to create message in the apex programming 
 * Syntax: 
 * Apexpages.Message(Message Type,Message)
 * SeverityType : Error ,Info, warning ,Confirm
 */
public class Message_Example {
    public Message_Example(){
        Apexpages.Message msg1 =new Apexpages.Message(Apexpages.Severity.Error,'Error Message');
        Apexpages.Message msg2 =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Confirmation Message');
        Apexpages.Message msg3 =new Apexpages.Message(Apexpages.Severity.Warning,'This is warning');
        Apexpages.Message msg4 =new Apexpages.Message(Apexpages.Severity.INFO,'This is information');
        Apexpages.addMessage(msg1);
        Apexpages.addMessage(msg2);
        Apexpages.addMessage(msg3);
        Apexpages.addMessage(msg4);
    }
}