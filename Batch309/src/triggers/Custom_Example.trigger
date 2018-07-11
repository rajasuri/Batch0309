trigger Custom_Example on Account (before insert) {
    // Get the custom setting values for current user
	Manager__c manage =Manager__c.getInstance(userinfo.getUserId());
    if(manage.active__c== true){
        for(Account a: Trigger.new){
            a.rating='Hot';
            a.phone='9876543';
        }
    }}