import 'package:flutter/material.dart';

import 'src/models/sorters/sorter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Sorter sorter = BubbleSorter(100);

  _sort() => sorter.sort();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<List<int>>(
              initialData: sorter.rawData,
              stream: sorter.dataStream,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Text('Loading...');
                }

                List<int> data = snapshot.data!;

                return Column(
                  children: data.map<Widget>((int i) => Text('$i')).toList(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sort,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
