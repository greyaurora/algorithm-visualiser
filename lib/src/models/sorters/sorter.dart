import 'dart:async';
import 'dart:math';

part 'bubble_sorter.dart';

abstract class Sorter {
  bool running = false;

  final StreamController<List<int>> dataStreamController =
      StreamController<List<int>>.broadcast();

  Stream<List<int>> get dataStream => dataStreamController.stream;

  final List<int> rawData = [];

  Sorter(int size) {
    Random r = Random();

    for (int i = 0; i < size; i++) {
      rawData.add(r.nextInt(1000));
    }

    reset();
  }

  reset() => dataStreamController.add(rawData);

  shuffle() {
    rawData.shuffle();
    reset();
  }

  add(List<int> data) async {
    dataStreamController.add(data);

    await Future.delayed(const Duration(milliseconds: 2));
  }

  sort();
}
