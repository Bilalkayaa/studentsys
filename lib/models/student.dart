class Student{
  late int id;
  late String firstName="";
  String lastName="";
  late int grade;
  String status="";

  Student.withId(int id,String firstName, String lastName, int grade) {
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.status = "true";
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.status = "true";
  }

  Student.withoutInfo(){
    
  }
  
}