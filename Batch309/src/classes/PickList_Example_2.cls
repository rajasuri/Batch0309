public class PickList_Example_2 {
    public List<SelectOption> cities 		{set;get;}
    public List<SelectOption> places 		{set;get;}
    public Map<String,List<String>> cityMap {set;get;}
    public String selected					{set;get;}
    public PickList_Example_2(){
        cities =new List<SelectOption>();
        places =new List<SelectOption>();
        // City Name as key and Places as a value 
        cityMap=new Map<String,List<String>>(); 
        List<String> hplaces =new List<String>{'SRNagar','LBNagar'};
        List<String> bplaces =new List<String>{'Marthali','BTM'};
        List<String> cplaces =new List<String>{'Thambaram','TNagar'};
            // Inserting new values in the map
        cityMap.put('Hyd',hplaces);
        cityMap.put('Ban',bplaces);
        cityMap.put('Che',cplaces);
        // KeySet will return set of keys,in the cityMap city name is the key
        Set<String> keys =cityMap.keySet(); // Hyd,Ban,Che
        // Create a none option and add it to cities and places 
        SelectOption n=new SelectOption('none','-None-');
        cities.add(n);
        places.add(n);
        // Take one by one city name and create picklist option for it SelectOption(s,s): itemValue=s itemLabel=s
        for(String s:keys){
            SelectOption op=new SelectOption(s,s);
            cities.add(op);
        }
    }
	   public void invoke(){
        // Remove all the options from the places .
       places.clear();
        // Add none option to the places 
        SelectOption n=new SelectOption('none','-None-');
        places.add(n);
        // when new city selected is not equal to none 
        if(selected!='none'){
            // get the places 
            List<String> myPlaces =cityMap.get(selected);
            for(String s:myPlaces){
                SelectOption op=new SelectOption(s,s);
                places.add(op);
            } 
        }
    }
}