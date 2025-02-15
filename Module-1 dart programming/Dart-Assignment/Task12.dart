// Task 12:
// Create a function that accepts a list of numbers and returns the largest and smallest
// numbers in the list.

import 'dart:math';

void main() {
  List<int> numbers = [5, 2, 9, 1, 5, 6];

  if (numbers.isEmpty) {
    print("List is empty.");
  } else {
    int largest = numbers.reduce(max);
    int smallest = numbers.reduce(min);

    print("Largest: $largest");
    print("Smallest: $smallest");
  }
}