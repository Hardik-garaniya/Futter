// Task 21:
// Create a program that accepts a number from the user and performs division by another
// number. Use exception handling to manage division by zero errors.

import 'dart:io';

void main()
{
  try{

    print("Enter the numerator");
    double numerator = double.parse(stdin.readLineSync()!);

    print("Enter the denominator");
    double denominator = double.parse(stdin.readLineSync()!);

    if(denominator == 0)
      {
        print("Error: Division by zero is not allowed.");
      }
    else
      {
        double result = numerator / denominator;
        print("The result of the division is: $result");
      }

  }
  catch(e)
  {
    print("Error: Invalid input. Please enter valid numbers.");
  }
}





