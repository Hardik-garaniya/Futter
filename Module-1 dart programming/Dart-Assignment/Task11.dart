// Task 11:
// Write a recursive function to generate the Fibonacci series up to a specified number

import 'dart:io';

void main() {
  int a = 0, b = 1, next;


  print("Enter the maximum number for the Fibonacci series: ");
  int? maxNum = int.tryParse(stdin.readLineSync()!);

  if (maxNum != null && maxNum >= 0) {
    print("Fibonacci series up to $maxNum:");

    while (a <= maxNum) {
      print("$a ");
      next = a + b;
      a = b;
      b = next;
    }

    print("");
  } else {
    print("Please enter a valid non-negative integer.");
  }
}

