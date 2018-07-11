public class Apex_DML_6 {
	public String objName ;
    public String lastName;
    public String phone;
    public String firstName;
    public void create(){
        if(objName=='Lead'){
            Lead my=new Lead();
            my.LastName=lastName;
            my.FirstName=firstName;
            my.Company='Wipro';
            my.Phone=phone;
            insert my;
        }else{
            Contact con=new Contact();
            con.lastName=lastName;
            con.firstName=firstName;
            con.phone=phone;
            insert con;
        }
    }
}