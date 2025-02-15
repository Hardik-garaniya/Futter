// Task 15:
// Write a program that counts the frequency of each character in a given string and stores the
// result in a map.

import 'dart:collection';

Map<String, int> countCharacterFrequencies(String str) {
  Map<String, int> charCounts = {};

  for (String char in str.split('')) {
    charCounts[char] = (charCounts[char] ?? 0) + 1;
  }

  return charCounts;
}

void main() {
  String inputString = "hello world";
  Map<String, int> charFrequencies = countCharacterFrequencies(inputString);

  print("Character frequencies:");
  charFrequencies.forEach((char, count) {
    print("$char: $count");
  });
}