import 'package:flutter/material.dart';
import 'package:sqflite_assessment/studentmodel.dart';
import 'dbhelper.dart';

class UpdateStudentScreen extends StatefulWidget {
  final Student student;

  UpdateStudentScreen({required this.student});

  @override
  _UpdateStudentScreenState createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _courseController;
  late TextEditingController _addressController;
  late TextEditingController _pincodeController;
  late TextEditingController _cityController;
  late TextEditingController _contactController;
  late TextEditingController _marksController;
  late TextEditingController _totalFeesController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.student.firstName);
    _lastNameController = TextEditingController(text: widget.student.lastName);
    _emailController = TextEditingController(text: widget.student.email);
    _courseController = TextEditingController(text: widget.student.course);
    _addressController = TextEditingController(text: widget.student.address);
    _pincodeController = TextEditingController(text: widget.student.pincode);
    _cityController = TextEditingController(text: widget.student.city);
    _contactController = TextEditingController(text: widget.student.contactNumber);
    _marksController = TextEditingController(text: widget.student.marks.toString());
    _totalFeesController = TextEditingController(text: widget.student.totalFees.toString());
  }

  void _updateStudent() async {
    if (_formKey.currentState!.validate()) {
      Student updatedStudent = Student(
        id: widget.student.id,
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

      await DatabaseHelper.updateStudent(updatedStudent, widget.student.id!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student updated successfully')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.limeAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                _buildTextFormField(
                  controller: _firstNameController,
                  label: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                  icon: Icons.person,
                ),

                _buildTextFormField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                  icon: Icons.person_outline,
                ),

                _buildTextFormField(
                  controller: _emailController,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  icon: Icons.email,
                ),

                _buildTextFormField(
                  controller: _courseController,
                  label: 'Course Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course name';
                    }
                    return null;
                  },
                  icon: Icons.book,
                ),

                _buildTextFormField(
                  controller: _addressController,
                  label: 'Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                  icon: Icons.home,
                ),

                _buildTextFormField(
                  controller: _pincodeController,
                  label: 'Pincode',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pincode';
                    }
                    return null;
                  },
                  icon: Icons.location_on,
                ),

                _buildTextFormField(
                  controller: _cityController,
                  label: 'City',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                  icon: Icons.location_city,
                ),

                _buildTextFormField(
                  controller: _marksController,
                  label: 'Marks',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter marks';
                    }
                    return null;
                  },
                  icon: Icons.score,
                ),

                _buildTextFormField(
                  controller: _totalFeesController,
                  label: 'Total Fees',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total fees';
                    }
                    return null;
                  },
                  icon: Icons.money,
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _updateStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.limeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Update Student', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    required IconData icon,  // Add the icon parameter
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.limeAccent),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
