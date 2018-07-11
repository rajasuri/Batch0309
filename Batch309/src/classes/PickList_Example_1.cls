/* SelectOption : 
 * 1. This is a predefined apex class
 * 2. This is used to create options for picklist ....
 * 3. SelectOption(itemValue,itemLabel)
 * <apex:selectOption itemValue="" itemLabel="" />
 * 	SelectOption op=new SelectOption('none','-None-');
 *  SelectOption op1=new SelectOption('Hyd','TG');
 *  SelectOption op2=new SelectOption('Ban','Ban');
 *  String s ='Wipro';
 *  SelectOption op3=new SelectOption(s,s); 
 */
public class PickList_Example_1 { 
    public List<String> cities 		  {set;get;}
    public List<SelectOption> options {set;get;}
    public PickList_Example_1(){
        cities=new List<String>{'Hyd','Ban','Che','Pune'};
        options =new List<SelectOption>();
        for(String s: cities ){
            SelectOption op=new SelectOption(s,s); // itemValue =s itemLabel=s 
            options.add(op);
        }
     }
}