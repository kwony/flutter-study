import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/widgets/ListView-class.html

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListViewPage> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewPage> {
  final List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100, 600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: const Color(0xffd8d8d8),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) { // 필요할 때에 맞춰서 아이템을 만들어줌... 좋구나 이거....
          return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}'))
          );
        },
      ),
    );
  }
}