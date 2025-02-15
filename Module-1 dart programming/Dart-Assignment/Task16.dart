// Task 16:
// Create a simple address book using a map, where the keys are names and the values are
// phone numbers. Add, update, and remove entries based on user input.


import 'dart:io';

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print("\nAddress Book Menu:");
    print("1. Add Entry");
    print("2. Update Entry");
    print("3. Remove Entry");
    print("4. Search Entry");
    print("5. Display All Entries");
    print("6. Exit");

    print("Enter your choice (1-6): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("Enter Name:");
        String name = stdin.readLineSync()!;
        print("Enter Phone Number:");
        String phoneNumber = stdin.readLineSync()!;
        addressBook[name] = phoneNumber;
        print("Entry added successfully!");
        break;

      case '2':
        print("Enter Name:");
        String name = stdin.readLineSync()!;
        if (addressBook.containsKey(name)) {
          print("Enter New Phone Number:");
          String phoneNumber = stdin.readLineSync()!;
          addressBook[name] = phoneNumber;
          print("Entry updated successfully!");
        } else {
          print("Name not found.");
        }
        break;

      case '3':
        print("Enter Name:");
        String name = stdin.readLineSync()!;
        if (addressBook.containsKey(name)) {
          addressBook.remove(name);
          print("Entry removed successfully!");
        } else {
          print("Name not found.");
        }
        break;

      case '4':
        print("Enter Name:");
        String name = stdin.readLineSync()!;
        if (addressBook.containsKey(name)) {
          print("Phone Number: ${addressBook[name]}");
        } else {
          print("Name not found.");
        }
        break;

      case '5':
        if (addressBook.isEmpty) {
          print("Address book is empty.");
        } else {
          print("Address Book Entries:");
          addressBook.forEach((name, phoneNumber) {
            print("$name: $phoneNumber");
          });
        }
        break;

      case '6':
        print("Exiting Address Book.");
        exit(0);

      default:
        print("Invalid choice. Please enter a number between 1 and 6.");
    }
  }
}