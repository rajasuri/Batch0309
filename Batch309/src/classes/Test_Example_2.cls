@isTest
public class Test_Example_2 {
	@isTest
    static void testMe(){
        Apex_Example_2 ae =new Apex_Example_2();
        ae.setData();
        System.assertEquals('Banking',ae.industry);
        System.assertEquals('Hot',ae.rating);
        ae.reset();
        System.assertEquals('Energy',ae.industry);
        System.assertEquals('Warm',ae.rating);
    }
}