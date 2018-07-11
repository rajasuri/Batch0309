@isTest
public class Test_Example_5 {
	@isTest
    static void testMe(){
        Apex_DML_5 ad =new Apex_DML_5();
        ad.accName='Wipro';
        ad.phone='040-1234';
        ad.rating='Hot';
        ad.create();
        Integer count =[select count() from Account where name=:ad.accName ];
        System.assertEquals(1,count);
        ad.delData();
        Integer size=[select count() from Account where createddate=TODAY];
        System.assertEquals(0,size);
    }
}