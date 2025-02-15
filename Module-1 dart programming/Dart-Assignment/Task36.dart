// Task 36:
// Implement a basic file reading and writing program using the dart:io library. Write data to a
// file and read it back, handling any file errors that may occur.

import 'dart:io';

void main() async {
  String filePath = 'example.txt';

  await writeToFile(filePath, 'Hello, Dart File I/O!\nThis is a basic file handling example.');

  await readFromFile(filePath);
}

Future<void> writeToFile(String filePath, String data) async {
  try {
    final file = File(filePath);
    await file.writeAsString(data);
    print('Data written to file: $filePath');
  } catch (e) {
    print('Error writing to file: $e');
  }
}

Future<void> readFromFile(String filePath) async {
  try {
    final file = File(filePath);
    String contents = await file.readAsString();
    print('Data read from file:');
    print(contents);
  } catch (e) {
    print('Error reading from file: $e');
  }
}
