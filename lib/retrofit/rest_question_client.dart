import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'question_model.dart';

part 'rest_question_client.g.dart';

@RestApi(baseUrl: "https://trotking-api.herokuapp.com")
abstract class QuizApiClient {
  factory QuizApiClient(Dio dio, {String baseUrl}) = _QuizApiClient;

  @GET("/api/v1/quiz")
  Future<QuizResponse> getQuiz(@Query("quizId") int quizId);
}