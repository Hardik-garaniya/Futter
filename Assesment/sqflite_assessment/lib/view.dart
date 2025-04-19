import 'package:flutter/material.dart';
import 'package:sqflite_assessment/studentmodel.dart';
import 'package:sqflite_assessment/update.dart';
import 'dbhelper.dart';

class ViewStudentsScreen extends StatefulWidget {
  @override
  _ViewStudentsScreenState createState() => _ViewStudentsScreenState();
}

class _ViewStudentsScreenState extends State<ViewStudentsScreen> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  void _loadStudents() async {
    var result = await DatabaseHelper.getAllStudents();
    setState(() {
      students = result.map((e) => Student.fromMap(e)).toList();
    });
  }

  void _deleteStudent(int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this student?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                await DatabaseHelper.deleteStudent(id);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student deleted successfully')));
                Navigator.pop(context);
                _loadStudents();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateStudent(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateStudentScreen(student: student),
      ),
    ).then((_) {
      _loadStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Students', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.limeAccent,
        elevation: 0,
      ),
      body: students.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              title: Text('${students[index].firstName} ${students[index].lastName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Text('Course: ${students[index].course}', style: TextStyle(color: Colors.grey[600])),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.deepPurple),
                    onPressed: () => _updateStudent(students[index]), // Navigate to update screen
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => _deleteStudent(students[index].id!), // Delete student
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
