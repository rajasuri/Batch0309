public class Schema_Example_3 {
    public Map<String,List<String>> optionsMap {set;get;}
    public Schema_Example_3(){
       // Initailize the Map where FieldName is the key and list of options is the value 
       optionsMap=new Map<String,List<String>>();
       
       // Get the description about the object.
       Schema.DescribeSobjectResult result =Account.SobjectType.getDescribe();
       
       // Get the fields of the given object 
       Map<String,Schema.SobjectField> fldMap =result.fields.getMap();
       
       // Fetch the fieldNames from the Map
       Set<String> fieldNames =fldMap.keySet();
       System.debug('FieldNames:'+fieldNames);
       for(String s: fieldNames){
           // Based on the field Name get the field
           Schema.SobjectField fld =fldMap.get(s);
           System.debug('FieldName:'+s);
           // Get the description of a fields 's'
           Schema.DescribeFieldResult res=fld.getDescribe();
           // Check weather the fields is custom Fields : isCustom()
           // Check weather the fields is picklist : getType() ==Schema.DisplayType.PICKLIST
           if(res.isCustom() && res.getType() == Schema.DisplayType.PICKLIST){
               // Get the existing options in the given picklist field using getPickListValues();
               List<Schema.PicklistEntry> options =res.getPickListValues();
               if(options.size()>1){
               		List<String> labels =new List<String>();
               		// Get the option itemLabel names and put them in a list .
               		for(Schema.PicklistEntry p : options){
                   		labels.add(p.getLabel());
               		}
                   
               optionsMap.put(res.getLabel(),labels);
               }
           }
       }
        System.debug(optionsMap);
    }
}