/* Static Methods :
 * 1. If you define any method as static ,Method can use only static variables of a class.
 * 2. Static Methods are invoked using className
 */
public class Static_Methods {
	public Static Integer aval=0;
    public Static Integer bval=0;
    public Integer cval=0;
    public static void call(){
        aval=aval+10;
        bval=bval+10;
        String name='Satish'; // all the local variables will be non-static
        // cval=10; Non-static variables cannot be used in the static method
    }
    public void invoke(){
        aval=90;
        bval=100;
        cval=150;
    }
}