public class Schema_Example_1 {
    public Map<String,Object> resMap{set;get;}
    public Schema_Example_1(){
        resMap=new Map<String,Object>();
        Schema.DescribeSObjectResult result =Account.SobjectType.getDescribe();
        resMap.put('Label',result.getLabel());
        resMap.put('Name',result.getName());
        resMap.put('PuralLabel',result.getLabelPlural());
        resMap.put('Custom',result.isCustom());
        resMap.put('CustomSetting',result.isCustomSetting());
        resMap.put('Create',result.isCreateable());
        resMap.put('Read',result.isAccessible());
        resMap.put('Update',result.isUpdateable());
        resMap.put('Delete',result.isDeletable());
        resMap.put('Undelete',result.isUndeletable());
        resMap.put('Merge',result.isMergeable());
        resMap.put('MRU',result.isMruEnabled());
        resMap.put('Queury',result.isQueryable());
        resMap.put('Search',result.isSearchable());
        resMap.put('Feed Enabeled',result.isFeedEnabled());
        resMap.put('Sub Type',result.getIsSubtype());
        resMap.put('Key ',result.getKeyPrefix());
    }
}