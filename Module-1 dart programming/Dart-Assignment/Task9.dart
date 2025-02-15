// Task 9:
// Write a function to calculate the factorial of a number entered by the user.

import 'dart:io';

int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

void main() {
  print("Enter a non-negative integer:");
  int number = int.parse(stdin.readLineSync()!);

  if (number < 0) {
    print("Factorial is not defined for negative numbers.");
  } else {
    int result = factorial(number);
    print("The factorial of $number is $result");
  }
}