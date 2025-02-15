// Task 32:
// Implement a simple number guessing game where the computer generates a random
// number, and the user has to guess it. Use a lambda function to provide hints, such as “too
// high” or “too low.”

import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int targetNumber = random.nextInt(100) + 1;

  print("Welcome to the Number Guessing Game!");
  print("I have chosen a number between 1 and 100. Can you guess it?");

  String Function(int) hint = (int guess) {

    if (guess < targetNumber) {

      return "Too low!";

    } else if (guess > targetNumber) {

      return "Too high!";

    } else {

      return "Correct! You guessed the number.";

    }
  };

  while (true) {
    stdout.write("Enter your guess: ");
    try {
      int guess = int.parse(stdin.readLineSync()!);
      String response = hint(guess);
      print(response);

      if (guess == targetNumber) {
        break;
      }
    } catch (e) {
      print("Invalid input. Please enter a valid integer.");
    }
  }

  print("Thank you for playing!");
}
