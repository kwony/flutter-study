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
  bool toggle = true;

  void click() {
    setState(() {
      _counter++;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return const Text('Toggle True');
    } else {
      return const Text('Toggle False');
    }
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
              child: ListView(
                children: [
                  const Text("1234"),
                  const Text("1234"),
                  const Text("1234"),
                  Container(
                    alignment: Alignment.topCenter,
                    color: Colors.blue,
                    child: Image.asset("assets/images/ic_close.png"),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    color: Colors.blue,
                    child: Image.network('https://picsum.photos/250?image=9'),
                  ),
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        toggle = !toggle;
                      })
                    },
                    child: _getToggleChild(),
                  ),
                  GestureDetector(
                    onTap: () => { Navigator.of(context).pushNamed('/a') },
                    child: Container(
                      color: Colors.green,
                      child: const Align(
                        child: Text(
                          "다음장으로",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.purple, fontSize: 30),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.orange, shape: BoxShape.circle),
                              width: 60,
                              height: 60,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    "assets/images/test_seulgi.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ProfileWidget()
                ],
              ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$_counter'),
                            Container(
                              color: Colors.purple,
                              width: 50,
                              height: 50,
                            )
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: Colors.pink,
                          height: 100,
                        ),
                        Positioned(
                            child: Image.asset("assets/images/ic_close.png"))
                      ],
                    ),
                  ),
                  // Flexible(
                  //     flex: 1,
                  //     child: Container(
                  //       constraints: const BoxConstraints.expand(),
                  //       color: Colors.cyanAccent,
                  //       child: Text('1234'),
                  //     )),
                  Flexible(
                      child: Container(
                    constraints: const BoxConstraints.expand(),
                    color: Colors.green,
                    child: const MyInfoContainer(
                      title: '내정보',
                    ),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}

class MyInfoContainer extends StatelessWidget {
  final String title;

  const MyInfoContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/ic_close.png"),
          Text(title),
        ],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, color: Colors.black);
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/test_seulgi.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Flexible(
          //     flex: 1,
          //     child: Container(
          //       decoration: const BoxDecoration(
          //           color: Colors.orange, shape: BoxShape.circle),
          //       height: 60,
          //       child: Padding(
          //         padding: EdgeInsets.all(2),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(30),
          //           child: Image.asset(
          //             "assets/images/test_seulgi.png",
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     )
          // ),
          Expanded(
            child: Container(
              height: 60,
              color: Colors.purple,
            ),
          ),
          // Flexible(
          //     flex: 1,
          //     child: Container(
          //       height: 60,
          //       color: Colors.cyanAccent,
          //     )),
          // Flexible(
          //     flex: 1,
          //     child: Container(
          //       height: 60,
          //       color: Colors.indigo,
          //     )),
        ],
      ),
    );
  }
}
