import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/widgets/ListView-class.html

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
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
    return Container(
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Container(
              width: 50,
              color: Colors.amber
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.deepOrange,

                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.orange,
                    )),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.blue,
                          )),
                      Flexible(child: Container(color: Colors.green))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}