import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:developer' as developer;

class QuestionContainer extends StatefulWidget {
  // todo 카드 불러오기
  @override
  State createState() {
    return _QuestionContainer();
  }
}

class Quiz {
  final int quizId;
  final String answer;
  final QuizContent quizContent;
  final int level;
  final int type;

  const Quiz({required this.quizId,
    required this.answer,
    required this.quizContent,
    required this.level,
    required this.type});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        quizId: json['quizId'],
        answer: json['answer'],
        quizContent: json['quizContent'],
        level: json['level'],
        type: json['type']);
  }
}

class QuizContent {
  final String question;
  final List<QuizAnswer> answerList;
  final String mediaPath;

  const QuizContent({required this.question,
    required this.answerList,
    required this.mediaPath});

  factory QuizContent.fromJson(Map<String, dynamic> json) {
    List<QuizAnswer> answerList = [];
    for (int i = 0; i < json['answerList'].length; i++) {
      QuizAnswer answer = QuizAnswer(answer: json['answerList'][i]);
      answerList.add(answer);
    }

    return QuizContent(
        question: json['question'],
        answerList: answerList,
        mediaPath: json['mediaPath']);
  }
}

class QuizAnswer {
  final String answer;

  const QuizAnswer({required this.answer});

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(answer: json['answer']);
  }
}

class _QuestionContainer extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("data"),
            QuestionPage(question: "question"),
            FutureBuilder(future: futureQuiz, builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text((snapshot.data! as String));
              } else {
                return const CircularProgressIndicator();
              }
            })
          ],
        ));
  }

  late Future<String> futureQuiz;

  @override
  void initState() {
    super.initState();

    developer.log('init stated called');

    futureQuiz = fetchQuiz();
  }
}

class Response {
  final int code;
  final Quiz? result;
  final String message;

  const Response({
    required this.code,
    required this.result,
    required this.message
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        result: Quiz.fromJson(json['result']),
        code: json['code'],
        message: json['message']);
  }
}

Future<String> fetchQuiz() async {
  final response =
  await http.get(
      Uri.parse('https://trotking-api.herokuapp.com/api/v1/quiz?quizId=81'));

  developer.log('i am here....');
  developer.log(response.statusCode.toString());
  developer.log(jsonDecode(response.body).toString());

  Response res = Response.fromJson(jsonDecode(response.body));

  developer.log(res.result.toString());

  return response.toString();
  // log("response: " + response.toString());
  //
  // if (response.statusCode == 200) {
  //   return Quiz.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to load album');
  // }
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
