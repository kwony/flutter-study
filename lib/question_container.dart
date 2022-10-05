import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/retrofit/QuizRepository.dart';
import 'package:flutter_study/retrofit/data.dart';
import 'package:flutter_study/retrofit/rest_client.dart';
import 'package:flutter_study/retrofit/question_model.dart';

import 'package:http/http.dart' as http;

import 'dart:developer' as developer;

class QuestionContainer extends StatefulWidget {
  // todo 카드 불러오기
  @override
  State createState() {
    return _QuestionContainer();
  }
}

FutureBuilder<ResponseData> _buildBody(BuildContext context) {

  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  return FutureBuilder<ResponseData>(
    future: client.getUsers(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final ResponseData posts = snapshot.data!;

        var name = "";

        posts.data?.forEach((element) {
          User user = User.fromJson(element);
          name += "${user.name}\n";
          developer.log("name: ${user.name}, email: ${user.email}");
        });

        return Text(name);
      } else {
        return const CircularProgressIndicator();
      }
    },
  );
}

// FutureBuilder<Quiz> buildQuizBody(BuildContext context) {
//   final quizRepo = QuizRepository();
//
//   return FutureBuilder(builder: builder)
// }

class _QuestionContainer extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("data"),
            QuestionPage(question: "question"),
            FutureBuilder<QuizResponse>(future: fetchQuiz(), builder: (context, snapshot) {
              if (snapshot.hasData) {
                developer.log("quiz response " + snapshot.data!.code.toString());
                developer.log("quiz resp message " + snapshot.data!.result.toString());

                final quizResp = QuizResp.fromJson(snapshot.data!.result);

                return Text(quizResp.quiz.answer!);
              } else {
                return const CircularProgressIndicator();
              }
            }),
            _buildBody(context)
          ],
        ));
  }

  late Future<String> futureQuiz;

  @override
  void initState() {
    super.initState();

    developer.log('init stated called');
  }
}


Future<QuizResponse> fetchQuiz() {
  QuizRepository repo = QuizRepository();

  return repo.getQuiz(81);
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
