public class Apex_Example_4 {
	public String leadSource;
    public String priority;
    public String status;
    public void setCase(){
        if(leadSource =='Web'){
            priority='High';
            status='New';
        }else{
            priority='Low';
            status='Closed';
        }
    }
}