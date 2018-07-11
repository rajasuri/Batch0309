public class Recursive_Trigger_Example {
	public static Boolean flag=true;
    public static void call(){
        if(flag==true){
            flag=false;
        	Account acc=new Account();
        	acc.Name='DMLExample';
        	acc.Phone='1111';
        	acc.Industry='Banking';
        	insert acc;
        }
    }
}