@isTest
public class Test_Example_3 {
	@isTest
    static void testMe(){
        Apex_Example_3 ae =new Apex_Example_3();
        ae.industry='Banking';
        ae.callMe();
        System.assertEquals(ae.ownership,'Public');
        System.assertEquals(ae.rating,'Hot');
        ae.Industry='Energy';
        ae.callMe();
        System.assertEquals(ae.ownership,'Private');
        System.assertEquals(ae.rating,'Warm');
      
    }
}