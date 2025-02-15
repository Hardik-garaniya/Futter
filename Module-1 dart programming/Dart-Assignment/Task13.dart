// Task 13:
// Write a program to input a list of integers and sort them in ascending and descending order
// without using built-in sort methods.


import 'dart:io';

void main() {
  print("Enter the number of integers:");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  print("Enter the integers:");
  for (int i = 0; i < n; i++) {
    numbers.add(int.parse(stdin.readLineSync()!));
  }

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (numbers[j] > numbers[j + 1]) {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }

  print("Sorted in ascending order:");
  print(numbers);

  // Sort in descending order
  numbers.sort((a, b) => b.compareTo(a));

  print("Sorted in descending order:");
  print(numbers);
}