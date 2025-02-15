// Task 30:
// Create a function that uses higher-order functions. Define a List of numbers and pass it to a
// function that returns a list of squares, cubes, or halves based on the function passed as an
// argument.


void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  List<num> transformList(List<int> list, num Function(int) operation) {
    return list.map(operation).toList();
  }

  num square(int n) => n * n;
  num cube(int n) => n * n * n;
  num half(int n) => n / 2;

  print("Original list: $numbers");
  print("Squares: ${transformList(numbers, square)}");
  print("Cubes: ${transformList(numbers, cube)}");
  print("Halves: ${transformList(numbers, half)}");
}
