import 'package:flutter/material.dart';
import 'package:flutter_application_2/validation/student_validator.dart';

import 'package:flutter_application_2/models/student.dart';

class StudentEdit extends StatefulWidget {
  
  Student? selectedStudent;

  StudentEdit( Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }
  @override


  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent!);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student? selectedStudent;
  _StudentAddState( Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }
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
      initialValue: selectedStudent!.firstName,
      validator: (value) => validateFirstName(value),
      onSaved: (value){
        selectedStudent!.firstName=value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "öğrenci soyadı",hintText: "Kaya"),
      initialValue: selectedStudent!.lastName,
      validator: (value) => validateLastName(value),
      onSaved: (value){
        selectedStudent!.lastName=value!;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "aldığı not",hintText: "65"),
      initialValue: selectedStudent!.grade.toString(),
      validator: (value) => validateGrade(value),
      onSaved: (value){
        selectedStudent!.grade=int.parse(value!);
      },
    );
  }
 
  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();          
            saveStudent();
            Navigator.pop(context,true);
            var alert = AlertDialog(
              title: Text("Sınav Sonucu"),
              content: Text("güncellendi"),
            );
            showDialog(context: context, builder: (BuildContext context) => alert);                             
        }
      },
    );
  }
  
  void saveStudent() {
    print(selectedStudent!.firstName + " "+selectedStudent!.lastName+" "+selectedStudent!.grade.toString());
  }
}
