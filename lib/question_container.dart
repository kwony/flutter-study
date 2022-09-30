import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionContainer extends StatefulWidget {

  // todo 카드 불러오기
  @override
  State createState() {
    return _QuestionContainer();
  }
}

class Question {

}

class _QuestionContainer extends State<QuestionContainer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("data"),
          QuestionPage(question: "question")
        ],


      )
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

class QuestionPage extends StatelessWidget {
  final String question;

  const QuestionPage({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/ic_close.png"),
          Text(question),
        ],
      ),
    );
  }
}