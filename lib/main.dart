import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/student_add.dart';
import 'package:flutter_application_2/screens/student_edit.dart';
import 'models/student.dart';


void main() {
  selamver();
  runApp(MaterialApp(
    home: MyApp(),
  ));
  
}

void selamver() {
  print("Hii");  
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  @override
  String mesaj = "Öğrenci takip sistemi";  
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Bilal", "Kaya", 25),
    Student.withId(2, "Engin", "Demiro", 65),
    Student.withId(3, "Halil", "Duymaz", 45)
  ];

  var ogrenciler = ["Engin", "Bilal", "Sefa", "12312"];
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajyaz(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: getBackgroundImage(index),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString()),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      print(selectedStudent.firstName+" "+selectedStudent.lastName+" "+selectedStudent.id.toString());
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },  
                  );
                })),
        Text(selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () async{
                  await Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentAdd(students))));
                  setState(() {
                    
                  });
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () async{
                  await Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentEdit(selectedStudent))));
                  setState(() {
                  });
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Silindi: " + selectedStudent.firstName;
                  mesajyaz(context, mesaj);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else {
      return Icon(Icons.clear);
    }
  }

  getBackgroundImage(int index) {
    if (students[index].firstName == "Bilal") {
      return NetworkImage(
          "https://pbs.twimg.com/profile_images/1572617744058654722/RaDBVx0Z_400x400.jpg");
    } else {
      return NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/c/c2/Henry_Cavill_%2848418080197%29_%28cropped%29.jpg");
    }
  }
}
