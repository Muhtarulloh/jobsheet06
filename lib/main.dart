import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daftar Mahasiswa'),
        ),
        body: StudentList(),
      ),
    );
  }
}

class Student {
  final String name;
  final String nim;

  Student({required this.name, required this.nim});
}

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final List<Student> students = [
       Student(name: 'Muhtarulloh', nim: 'STI202102153'),
    Student(name: 'Anggoro Mustika Putra', nim: 'STI202102152'),
    Student(name: 'Abdul Faiz', nim: 'STI202102147'),
    Student(name: 'Ade Setiawan', nim: 'ST202102159'),
    Student(name: 'Sulistiyo', nim: 'STI202102161'),
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  int currentIndex = 0;
  Color currentColor = Colors.black;

  void refresh() {
    setState(() {
      currentIndex = (currentIndex + 1) % students.length;
      currentColor = colors[Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    final student = students[currentIndex];
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            student.name,
            style: TextStyle(
              fontSize: 24,
              color: currentColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            student.nim,
            style: TextStyle(
              fontSize: 18,
              color: currentColor,
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: refresh,
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}