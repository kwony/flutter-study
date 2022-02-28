import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/widgets/ListView-class.html

class ListViewExpandedPage extends StatefulWidget {
  const ListViewExpandedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListViewExpandedPage> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExpandedPage> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100
  ];

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
        itemBuilder: (BuildContext context, int index) {

          const String centerRight = "c1234";

          if (index % 2 == 0) {
            return SizedBox(
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                        width: 50,
                        child: Container(
                            child:
                                Center(child: Text('Entry ${entries[index]}')),
                            width: 100,
                            color: Colors.amber[colorCodes[index]])),
                    Expanded(
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                      Container(
                        color: Colors.deepOrange,
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("bottomLeft"),
                        ),
                      ),
                      Container(
                        color: Colors.blueAccent,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text("abc"),
                        ),
                      ),
                    ]))
                  ],
                ));
          } else {
            return SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')),
                    )
                  ],
                ));
          }
        },
      ),
    );
  }
}
