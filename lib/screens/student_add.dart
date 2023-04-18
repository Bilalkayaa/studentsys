import 'package:flutter/material.dart';
import 'package:flutter_application_2/validation/student_validator.dart';

import 'package:flutter_application_2/models/student.dart';

class StudentAdd extends StatefulWidget {
  
  late List<Student> students;

  StudentAdd(List<Student> students){
    this.students=students;
  }
  @override


  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  late List<Student> students;
  _StudentAddState(List<Student> students){
    this.students=students;
  }
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeNameField(),
                buildSubmitButton()
              ],
            )
          ),
        )
      ),
    );
  }
    
  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "öğrenci adı",hintText: "BİLAL"),
      validator: (value) => validateFirstName(value),
      onSaved: (value){
        student.firstName=value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "öğrenci soyadı",hintText: "Kaya"),
      validator: (value) => validateLastName(value),
      onSaved: (value){
        student.lastName=value!;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "aldığı not",hintText: "65"),
      validator: (value) => validateGrade(value),
      onSaved: (value){
        student.grade=int.parse(value!);
      },
    );
  }
 
  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        student.id=students.length+1;
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();          
            students.add(student);
            saveStudent();
            Navigator.pop(context);                             
        }
      },
    );
  }
  
  void saveStudent() {
    print(student.firstName + " "+student.lastName+" "+student.grade.toString());
  }
}
