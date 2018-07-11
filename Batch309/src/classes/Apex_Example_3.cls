public class Apex_Example_3 {
    public String industry;
    public String rating;
    public String ownership;
    public void callMe(){
        if(industry =='Banking'){
            rating='Hot';
            ownership='Public';
        }else{
            rating='Warm';
            ownership='Private';
        }
    }
}