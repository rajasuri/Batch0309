/*  this : This is a keyword which is used to reffer to the members of the object ,when there 
 * 		   is a conflict between local and global variables 
 */
public class This_Example {
	public String name;
    public String city;
    public String phone;
    public This_Example(String empName,String city,String phone){
        name=empName;
        city=city;
        this.phone=phone;
    }
    public void show(){
        System.debug('Name :'+name);
        System.debug('City:'+city);
        System.debug('Phone:'+phone);
    }
}