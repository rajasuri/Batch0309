@isTest
public class Test_Example_9 {
	@isTest
    static void testMe(){
        Account acc =new Account();
        acc.Name='Testing';
        insert acc;
        Account newAcc=[select id ,rating,ownership from Account where id=:acc.Id];
        System.assertEquals(newAcc.rating,'Hot');
        System.assertEquals(newAcc.ownership,'Public');
    }
}