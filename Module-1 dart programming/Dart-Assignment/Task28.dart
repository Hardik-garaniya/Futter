// Task 28:
// Implement a mock weather fetching program. Display different messages as it waits for a
// response and then shows a message like “Weather data loaded successfully.”



import 'dart:async';
import 'dart:math';

void main() async {
  print('Fetching weather data...');
  await _simulateNetworkRequest();
  print('Weather data loaded successfully.');
}

Future<void> _simulateNetworkRequest() async {
  final randomDelay = Random().nextInt(3) + 1;
  await Future.delayed(Duration(seconds: randomDelay));

  if (Random().nextInt(10) < 2) {
    throw Exception('Network error occurred.');
  }
}