// Task 25:
// Write a program that simulates a delayed operation using Future.delayed. Display a loading
// message, wait for 3 seconds, and then show a completion message.

import 'dart:async';

void main()async{

  print("Loading...");

  await Future.delayed(const Duration(seconds: 3));

  print("peration completed!");


}

