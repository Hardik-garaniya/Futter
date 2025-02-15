// Task 31:
// Write a program that uses async* to create a stream of integers. Display each integer as it’s
// emitted and stop the stream after a certain count.

import 'dart:async';

void main() async {
  const int maxCount = 10;

  print("Stream of integers:");

  Stream<int> integerStream = generateIntegers(maxCount);

  await for (int number in integerStream) {
    print(number);
  }

  print("Stream completed.");
}

Stream<int> generateIntegers(int maxCount) async* {
  for (int i = 1; i <= maxCount; i++) {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    yield i;
  }
}
