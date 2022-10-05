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

class _QuestionContainer extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          color: const Color(0xffFFF9E4),
          child: Column(
            // crossAxisAlignment: Alignment.center,
            children: [
              FutureBuilder<Quiz>(
                  future: fetchQuiz(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final quiz = snapshot.data!;
                      return QuestionPage(
                        quiz: quiz,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              // _buildBody(context)
            ],
          ),
        ));
  }

  late Future<String> futureQuiz;

  @override
  void initState() {
    super.initState();

    developer.log('init stated called');
  }
}

Future<Quiz> fetchQuiz() {
  QuizRepository repo = QuizRepository();

  return repo.getQuiz(227).then((value) => value.quiz);
}

class QuestionPage extends StatelessWidget {
  final Quiz quiz;

  const QuestionPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final levelText = quiz.level == 1 ? "EASY" : "HARD";

    final quizLevel = Text(quiz.level == 1 ? "EASY" : "HARD", style: TextStyle(
      color: quiz.level == 1 ? Colors.blue : Colors.red,
      fontWeight: FontWeight.w700,
      fontSize: 16
    ),);

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(child: Row(
                children: [
                  quizLevel
                ],
              ), flex: 1,),
              Flexible(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("123"),
                  Text("456"),
                ],
              ), flex: 1,)
            ],
          ),
          Container(
            width: double.infinity,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.black),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                quiz.quizContent!.question!,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              )),
        ],
      ),
    );
  }
}
