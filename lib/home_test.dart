import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  @override
  State createState() => _HomeTest();
}

class _HomeTest extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/test_seulgi.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffFFDB5F),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: const Text(
                '도전하기',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.ideographic),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xff43DD65),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: const Text(
                '랭킹보기',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.ideographic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
