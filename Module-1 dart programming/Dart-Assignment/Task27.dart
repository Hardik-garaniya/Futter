// Task 27:
// Write a function that simulates fetching multiple data points (e.g., list of users)
// asynchronously. Use await and async keywords to wait for each "data point" to load, then
// display all the data once loaded.

import 'dart:async';
import 'dart:math';

Future<void> fetchDataPoints() async {
  List<Future<String>> futures = [];

  for (int i = 0; i < 5; i++) {
    futures.add(_fetchDataPoint(i));
  }

  List<String> dataPoints = await Future.wait(futures);

  print('All data points loaded:');
  for (String dataPoint in dataPoints) {
    print(dataPoint);
  }
}

Future<String> _fetchDataPoint(int index) async {
  await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
  return 'Data Point ${index + 1}';
}

void main() async {
  await fetchDataPoints();
}