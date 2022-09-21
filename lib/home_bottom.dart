import 'package:flutter/material.dart';
import 'package:flutter_study/container.dart';

// https://api.flutter.dev/flutter/widgets/ListView-class.html

class HomePractice extends StatefulWidget {
  const HomePractice({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePractice> createState() => _HomePractice();
}

class _HomePractice extends State<HomePractice> {
  int _counter = 0;

  void click() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.red,
            )),
            Container(
              height: 100,
              color: Colors.black,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                        onTap: click,
                        child: Container(
                          color: Colors.indigo,
                        )),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.blueGrey,
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('23kjdfjkdf $_counter'),
                            Container(
                              color: Colors.purple,
                              width: 100,
                              height: 50,
                            )
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    // child: Container(
                    //   color: Colors.orange,
                    // )
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: Colors.pink,
                          height: 100,
                        ),
                        Positioned(
                            child: Container(
                                color: Colors.blue,
                                width: 50,
                                height: 50,
                                alignment: Alignment.bottomCenter))
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.cyanAccent,
                      )),
                ],
              ),
            )
          ],
        ));
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, color: Colors.black);
  }
}
