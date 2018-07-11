@isTest
public class Test_Exampl_7 {
	@isTest
    static void testme(){
        Account acc =new Account();
        acc.Name='Testing';
        insert acc;
        Apex_Example_7 ae =new Apex_Example_7();
        Test.startTest();
        	Id jobId =Database.executeBatch(ae,5);
        Test.stopTest();
        Account newAcc=[select id,rating from Account where name=:acc.Name ];
        System.assertEquals(newAcc.rating,'Hot');
    }
}