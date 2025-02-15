// Task 24:
// Create a program that accepts a list of integers from the user. Use exception handling to
// handle cases where the user inputs non-integer values.

import 'dart:io';

void main() {
  List<int> integers = [];
  print("Enter integers one by one (type 'done' to finish):");

  while (true) {
    stdout.write("Enter a number: ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'done') {
      break;
    }

    try {
      int number = int.parse(input);
      integers.add(number);
    } catch (e) {
      print("Invalid input. Please enter a valid integer.");
    }
  }

  print("\nYou entered the following integers:");
  print(integers);
}
