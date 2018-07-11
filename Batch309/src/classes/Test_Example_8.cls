@isTest
public class Test_Example_8 {
	@isTest
    static void testme(){
        Account[] accs=Test_Data.callMe();
        Apex_Example_8 ae =new Apex_Example_8();
        String exp='0 0 10 2 3 ?';
        Test.startTest();
        	Id jobId=System.schedule('MyJob',exp,ae);
        Test.stopTest();
        Integer count =[select count() from Account where createdDate=TODAY];
        System.assertEquals(0,count);
        CronTrigger ct=[select cronExpression from CronTrigger where id=:jobId];
        System.assertEquals(exp,ct.CronExpression);
    }
}