class Student {
  int? id;
  String firstName;
  String lastName;
  String email;
  String course;
  String address;
  String pincode;
  String city;
  double totalFees;
  String contactNumber;
  double marks;

  Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.course,
    required this.address,
    required this.pincode,
    required this.city,
    required this.totalFees,
    required this.contactNumber,
    required this.marks,
  });

  // Convert Student object to a map for storing in the database
  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'course': course,
      'address': address,
      'pincode': pincode,
      'city': city,
      'total_fees': totalFees,
      'contact_number': contactNumber,
      'marks': marks,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      course: map['course'],
      address: map['address'],
      pincode: map['pincode'],
      city: map['city'],
      totalFees: map['total_fees'],
      contactNumber: map['contact_number'],
      marks: map['marks'],
    );
  }
}
