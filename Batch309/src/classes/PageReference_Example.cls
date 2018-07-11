/* PageReference : 
 * 1. It is a predefined apex class .
 * 2. It is used to reffer to apex class
 * 3. Syntax : 
 * 	  PageReference p=new PageReference(urlofpage)
 */ 

public class PageReference_Example {
    public Account acc {set;get;}
    public PageReference_Example(){
        acc=new Account();   
    }
    public PageReference create(){
        insert acc;
        PageReference p=new PageReference('/'+acc.id);
        return p;
    }
}