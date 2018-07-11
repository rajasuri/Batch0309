trigger Apex_Example_9 on Account (before insert) {
    for(Account a  :Trigger.new){
        a.Rating='Hot';
        a.Ownership='Public';
    }
}