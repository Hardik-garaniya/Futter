import 'package:flutter/material.dart';
import 'package:sqflite_assessment/studentmodel.dart';
import 'dbhelper.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _totalFeesController = TextEditingController();

  void _addStudent() async {
    if (_formKey.currentState!.validate()) {
      Student newStudent = Student(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        course: _courseController.text,
        address: _addressController.text,
        pincode: _pincodeController.text,
        city: _cityController.text,
        totalFees: double.parse(_totalFeesController.text),
        contactNumber: _contactController.text,
        marks: double.parse(_marksController.text),
      );

      await DatabaseHelper.insertStudent(newStudent);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student added successfully')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.limeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(_firstNameController, 'First Name', Icons.person, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                }),

                _buildTextField(_lastNameController, 'Last Name', Icons.person, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                }),

                _buildTextField(_emailController, 'Email', Icons.email, (value) {
                  if (value == null || value.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),

                _buildTextField(_courseController, 'Course', Icons.book, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                }),

                _buildTextField(_addressController, 'Address', Icons.location_on, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                }),

                _buildTextField(_pincodeController, 'Pincode', Icons.pin, (value) {
                  if (value == null || value.isEmpty || value.length != 6) {
                    return 'Please enter a valid pincode';
                  }
                  return null;
                }),

                _buildTextField(_cityController, 'City', Icons.location_city, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city name';
                  }
                  return null;
                }),

                _buildTextField(_contactController, 'Contact Number', Icons.phone, (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter a valid contact number';
                  }
                  return null;
                }, keyboardType: TextInputType.phone),

                _buildTextField(_totalFeesController, 'Total Fees', Icons.money, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total fees';
                  }
                  return null;
                }, keyboardType: TextInputType.number),

                _buildTextField(_marksController, 'Marks', Icons.grade, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter marks';
                  }
                  return null;
                }, keyboardType: TextInputType.number),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _addStudent,
                  child: Text('Add Student'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.limeAccent,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, String? Function(String?) validator, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
