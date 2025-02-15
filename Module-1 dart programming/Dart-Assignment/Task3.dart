// Task 3:
// Write a program to take a number from the user and determine if it’s even or odd.

import 'dart:io';
void main()
{

  print("Enter the number :");
  int num = int.parse(stdin.readLineSync()!);


  if(num % 2 == 0)
  {
    print("Number is even");
  }
  else
  {
    print("Number is odd");
  }
}