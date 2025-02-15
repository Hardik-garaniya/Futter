// Task 34:
// Create a program that generates a QR code from a given string using a QR code package,
// and display it in the console.

import 'dart:io';
import 'package:qr/qr.dart';
import 'package:qr/qr_image.dart';

void main() {
  // Prompt the user for input
  print('Enter the text to generate QR code:');

  // Read user input from the console
  String userInput = stdin.readLineSync() ?? '';

  if (userInput.isEmpty) {
    print('No input provided!');
    return;
  }

  // Generate QR code data from user input
  var qr = QrCode.fromData(
    data: userInput,
    errorCorrectLevel: QrErrorCorrectLevel.L,
  );

  // Create the QR code image representation as a 2D grid
  String qrCodeString = _generateQrCodeString(qr);

  // Print the QR code to the console
  print('\nQR Code:\n');
  print(qrCodeString);
}

/// Helper function to generate the QR code string representation for console output.
String _generateQrCodeString(QrCode qr) {
  String qrCodeString = '';
  for (int y = 0; y < qr.size; y++) {
    for (int x = 0; x < qr.size; x++) {
      qrCodeString += qr.isDark(y, x) ? '##' : '  ';
    }
    qrCodeString += '\n';
  }
  return qrCodeString;
}