public class JavaScript_3 {
    public String name 	 {Set;get;}
    public String branch {set;get;}
    public String result {Set;get;}
    public void call(){
        result='Your Name :'+name;
    }
    public void invoke(){
        result='Name :'+name+' Branch:'+branch;
    }
}