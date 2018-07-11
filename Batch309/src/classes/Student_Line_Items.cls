public class Student_Line_Items {
    public Student_Wrapper std              {Set;get;}
    public List<Student_Wrapper> students   {set;get;}
    public Student_Line_Items(){
        std=new Student_Wrapper();
        students =new List<Student_Wrapper>();
    }
    public void add(){
        students.add(std);
        // Remove the data from the stud
        std=new Student_Wrapper();
    }
}