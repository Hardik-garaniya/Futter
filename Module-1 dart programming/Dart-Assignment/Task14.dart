// Task 14:
// Create a program that takes a list of words and removes any duplicates. Use a set to
// eliminate duplicates, then display the unique words in alphabetical order.


import 'dart:io';

void main() {
  print("Enter a list of words separated by spaces:");
  String input = stdin.readLineSync()!;
  List<String> words = input.split(" ");

  Set<String> uniqueWords = Set.from(words);

  List<String> sortedWords = List.from(uniqueWords)..sort();

  print("Unique words in alphabetical order:");
  print(sortedWords);
}