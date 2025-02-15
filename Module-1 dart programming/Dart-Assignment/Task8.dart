// Task 8:
// Implement a basic calculator that performs addition, subtraction, multiplication, or division
// based on the user’s choice.

import'dart:io';

void main()
{

  print("Enter the number 1 :");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter the number 2 :");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Enter the operator (+, -, *, /):");
  String operator = stdin.readLineSync()!;

  double result;

  switch(operator)
  {
    case '+':
    result = num1 + num2;
    break;

    case '-':
      result = num1 - num2;
      break;

    case '*':
      result = num1 * num2;
      break;

    case '/':

      if(num2 != 0) {
        result = num1 / num2;
      }
      else
        {
          print("Error: Division by zero");
        }
    default:
      print("invalid oprator ");


  }
}

