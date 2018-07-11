@isTest
public class Test_Example_10 {
	@isTest
    static void testme(){
        Lead l=new Lead();
        l.lastName='k';
        l.firstName='Kiran';
        l.company='Testing';
        l.phone='1234';
        insert l;
        Contact c=[select id ,lastname,firstname,phone from Contact where createdDate=TODAY];
        System.assertEquals(c.lastName,l.lastName);
        System.assertEquals(c.firstName,l.firstName);
        System.assertEquals(c.phone,l.phone);
    }
}