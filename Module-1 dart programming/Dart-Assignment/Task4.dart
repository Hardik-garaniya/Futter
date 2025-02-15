// Task 4:
// Create a program that calculates the area and circumference of a circle. Use constants to
// store the value of pi.


import 'dart:io';

void main()
{
  double pi = 3.14;
  print("Enter Redius: ");
  double redius = double.parse(stdin.readLineSync()!);

  double area = pi * redius * redius;

  print("The area of the circle is: $area");
}