public virtual class ParentClass {
    public Integer age;
    public String name;
    public String city;
    public ParentClass(){
        System.debug('Iam Parent Class Constructor');
        age=40; 
    }
    public virtual void show(){
        System.debug('Name :'+name);
        System.debug('Age :'+age);
        System.debug('City:'+city);
    }
}