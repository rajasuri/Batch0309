public class Example {
	public String name;
    public String city;
    public Example(){
        name='Satish';
        city='Hyd';
    }
    public void show(){
        System.debug('Name :'+name);
        System.debug('City:'+city);
    }
}