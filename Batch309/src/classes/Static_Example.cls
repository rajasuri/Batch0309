/* Static : 
 * 1. It is a keyword used with variables or Methods .
 * 2. If you define any variable as static ,
 * 		a. Memory will be allocated on the name of class at the time of loading  the class.
 * 		b. Memory for static variable will be allocated only onces
 * 		c. Static Variables will invoked using className.
 * 		d. Static variables data can be modified or accessed by any object.
 * 3. Memory for non-static variables will be allocated- no of times based on no of objects.
 * 4. Non-Static variables are accessed using object.
 */
public class Static_Example {
	public Integer aval=0;
    public Static Integer bval=0;
    public Integer cval;
    public void add(){
        aval=aval+10;
        bval=bval+10;
        cval=aval+bval;
        
    }
}