// Task 6:
// Create a simple grading system that takes a student’s score as input and prints their grade:
// • A: 90–100
// • B: 80–89
// • C: 70–79
// • D: 60–69
// • F: Below 60

import 'dart:io';

void main()
{

  print("Enter the student marks : ");
  int marks = int.parse(stdin.readLineSync()!);

  String grade;

  if(marks >= 90)
    {
      grade = "A";
    }
  else if(marks >= 80)
    {
      grade = "B";
    }
  else if(marks >= 70)
    {
      grade = "C";
    }
  else if(marks >= 60)
    {
      grade = "D";
    }
  else
    {
      grade ="F";
    }

  print("The student grade is : $grade");
}