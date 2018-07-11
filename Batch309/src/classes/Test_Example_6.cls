@isTest
public class Test_Example_6 {
	@isTest
    static void testme(){
        Apex_DML_6 ad =new Apex_DML_6();
        ad.objName='Lead';
        ad.LastName='KL';
        ad.firstName='Kiran';
        ad.phone='1234';
        ad.create();
        Integer count =[select count() from Lead where LastName=:ad.LastName and FirstName=:ad.FirstName];
        System.assertEquals(1,count);
        ad.objName='Contact';
        ad.create();
        Integer size=[select count() from Contact where lastname=:ad.lastname and firstname=:ad.firstname];
        System.assertEquals(1,size);
    }
}