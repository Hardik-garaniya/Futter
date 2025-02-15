// Task 23:
// Implement a calculator that catches invalid input errors (like entering a string instead of a
// number). Display appropriate error messages and ask for re-entry.


import 'dart:io';

void main() {
  print("Simple Calculator");
  double num1 = getNumber("Enter the first number: ");
  double num2 = getNumber("Enter the second number: ");
  String? operator = getOperator();

  try {
    double result = calculate(num1, num2, operator!);
    print("Result: $num1 $operator $num2 = $result");
  } catch (e) {
    print("Error: ${e.toString()}");
  }
}

double getNumber(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return double.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Invalid input. Please enter a valid number.");
    }
  }
}

String? getOperator() {
  while (true) {
    stdout.write("Enter an operator (+, -, *, /): ");
    String? operator = stdin.readLineSync();
    if (operator == '+' || operator == '-' || operator == '*' || operator == '/') {
      return operator;
    } else {
      print("Invalid operator. Please enter one of +, -, *, /.");
    }
  }
}

double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) throw Exception("Division by zero is not allowed.");
      return num1 / num2;
    default:
      throw Exception("Unsupported operator.");
  }
}
