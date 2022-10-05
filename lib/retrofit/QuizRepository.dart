import 'package:dio/dio.dart';
import 'package:flutter_study/retrofit/data.dart';
import 'package:flutter_study/retrofit/question_model.dart';
import "package:flutter_study/retrofit/rest_question_client.dart";

class QuizRepository {
  QuizApiClient apiClient = QuizApiClient(Dio());

  Future<QuizResp> getQuiz(int quizId) {
    return apiClient.getQuiz(quizId).then((value) => QuizResp.fromJson(value.result));
  }
}