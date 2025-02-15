// Task 10:
// Create a function that checks if a string is a palindrome (reads the same backward as
// forward).

import 'dart:io';

void main() {
  print("Enter a string:");
  String input = stdin.readLineSync()!;

  if (isPalindrome(input)) {
    print("$input is a palindrome.");
  } else {
    print("$input is not a palindrome.");
  }
}

bool isPalindrome(String str) {
  String cleanStr = str.toLowerCase().replaceAll(RegExp(r' '), ''); // Remove spaces and convert to lowercase
  String reversedStr = String.fromCharCodes(cleanStr.codeUnits.reversed);
  return cleanStr == reversedStr;
}