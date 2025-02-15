// Task 29:
// Write a program that uses the spread operator to combine multiple lists into one list.
// Remove duplicates and sort the list in ascending order.

void main() {
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [3, 4, 5];
  List<int> list3 = [2, 5, 6];

  List<int> combinedList = [...list1, ...list2, ...list3];

  Set<int> uniqueSet = Set.from(combinedList);

  List<int> sortedList = uniqueSet.toList()..sort();

  print(sortedList);
}