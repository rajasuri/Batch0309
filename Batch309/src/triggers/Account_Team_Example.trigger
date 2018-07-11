/* When ever a new Account is Created with Industry as Banking then create wilson as AccountTeammeber 
 * Step 1: Enable Account Teams 
 *  Setup
 *  |---> Build 
 *        |---> Customize
 *              |---> Accounts 
 *                    |--->Account Teams 
 *                         |--->Enable Teams
 *                              |--->Add to the pageLayouts 
 * 
 * AccountTeamMember: 
 * 1. It is a pre-defined apex class .
 * 2. This class contains the following properties 
 *      a. AccountId            : Id of the account on which we want to create teammember
 *      b. UserId           : Id of the user ,with whom you want to share
 *      c. TeamMemberRole       : Role of the users
 *      d. AccountAccessLevel   :Read/Edit
 */
trigger Account_Team_Example on Account (after insert) {
    User u=[select id from User where alias='kiran'];
    List<AccountTeamMember> teams =new List<AccountTeamMember>();
    for(Account a: Trigger.new){
        if(a.Industry=='Banking'){
            AccountTeamMember atm=new AccountTeamMember();
            atm.AccountId=a.id;
            atm.userId=u.Id;
            atm.TeamMemberRole='Account Manager';
            atm.AccountAccessLevel='Edit';
            teams.add(atm);
        }
    }
    insert teams;
}
/* When ever new Account is created with rating as hot create a wilson as accountTeammember */