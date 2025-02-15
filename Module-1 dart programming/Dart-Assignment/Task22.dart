// Task 22:
// Write a program that reads a file and displays its contents. Handle potential file not found
// exceptions and display an error message if the file doesn’t exist.


import 'dart:io';

void main() {
  stdout.write("Enter the file name (with path if needed): ");
  String? fileName = stdin.readLineSync();

  if (fileName == null || fileName.isEmpty) {
    print("Error: No file name provided.");
    return;
  }

  try {
    File file = File(fileName);
    String contents = file.readAsStringSync();
    print("File contents:\n$contents");
  } on FileSystemException {
    print("Error: The file \"$fileName\" does not exist.");
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
