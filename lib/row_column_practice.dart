import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/widgets/ListView-class.html

class RowColumnPracticePage extends StatefulWidget {
  const RowColumnPracticePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RowColumnPracticePage> createState() => _RowColumnPracticePage();
}

class _RowColumnPracticePage extends State<RowColumnPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Align(
          alignment: Alignment.topLeft,
          child: Container(
              height: 100,
              color: Colors.white,
              child: Row(
                children: [
                  Container(color: Colors.blue, width: 50),
                  Flexible(
                      child: Container(
                    color: Colors.red,
                    width: 50,
                  )),
                  const Text("Expanded Study"),
                ],
              ))),
    );
  }
}