public virtual class ChildClass extends ParentClass{
    public Integer age;
    public childClass(){
        System.debug('Iam Child Class');
        name='Satish';
        city='Hyd';
    }
    public virtual override void show(){
        System.debug('This is child show');
    }
}