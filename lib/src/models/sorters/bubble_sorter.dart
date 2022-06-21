part of 'sorter.dart';

class BubbleSorter extends Sorter {
  BubbleSorter(int size) : super(size);

  @override
  sort() async {
    if (running == true) return;

    running = true;

    List<int> sortableData = rawData.toList();

    for (int i = 0; i < sortableData.length; i++) {
      for (int j = 0; j < sortableData.length - i - 1; j++) {
        if (sortableData[j] > sortableData[j + 1]) {
          int temp = sortableData[j];
          sortableData[j] = sortableData[j + 1];
          sortableData[j + 1] = temp;

          await add(sortableData);
        }
      }
    }

    running = false;
  }
}
