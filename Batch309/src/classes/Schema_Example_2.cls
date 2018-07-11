public class Schema_Example_2 {
    public List<String> fields {set;get;}
    public Schema_Example_2(){
        Schema.DescribeSobjectResult result =Account.sobjectType.getDescribe();
        // Fields.getMap() : It will return all the fields in the form of Map where fieldName is key
        // field is the value.
        Map<String,Schema.SObjectField> fldMap =result.fields.getMap();
        fields=new List<String>();
        //keySet() : It will return all the fieldNames from the map.
        Set<String> keys =fldMap.keySet();
        fields.addAll(keys);
    }
}