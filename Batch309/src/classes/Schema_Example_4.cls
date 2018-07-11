public class Schema_Example_4 {
    public List<String> objectNames  {set;get;}
    public Schema_Example_4(){
        Map<String,Schema.SobjectType> objMap =Schema.getGlobalDescribe();
        // Key is the object Name and ObjectType is the value .
        Set<String> keys =objMap.keySet();
        objectNames =new List<String>(keys);
    }
}