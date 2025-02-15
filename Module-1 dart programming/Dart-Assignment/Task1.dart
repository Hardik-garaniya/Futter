// Task 1:
// Write a program that takes a user's name and age as input and prints a welcome message
// that includes their name and how many years they have left until they turn 100.


import 'dart:io';
void main()
{

  print("What's your name ? ");
  String name=stdin.readLineSync()!;

  print("Hi, $name ! What your age ?");
  int age = int.parse(stdin.readLineSync()!);
  int yearToHunderd = 100 - age;

  print("$name , You Have $yearToHunderd year to be 100");

}