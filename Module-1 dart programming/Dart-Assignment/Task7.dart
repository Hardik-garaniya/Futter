// Task 7:
// Write a program that accepts a number and checks if it is a prime number or not.

import 'dart:io';
void main()
{

  print("Enter the number :");
  int num = int.parse(stdin.readLineSync()!);


  if(num % 2 == 0)
  {
    print("Number is not prime");
  }
  else
  {
    print("Number is prime");
  }
}