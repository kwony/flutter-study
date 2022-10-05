import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Quiz {
  final int? quizId;
  final String? answer;
  final QuizContent? quizContent;
  final int? level;
  final int? type;

  const Quiz({required this.quizId,
    required this.answer,
    required this.quizContent,
    required this.level,
    required this.type});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class QuizContent {
  final String? question;
  final List<QuizAnswer> answerList;


  const QuizContent({required this.question,
    required this.answerList});

  factory QuizContent.fromJson(Map<String, dynamic> json) => _$QuizContentFromJson(json);

  Map<String, dynamic> toJson() => _$QuizContentToJson(this);
}

@JsonSerializable()
class QuizAnswer {
  final String answer;

  const QuizAnswer({required this.answer});

  factory QuizAnswer.fromJson(Map<String, dynamic> json) => _$QuizAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$QuizAnswerToJson(this);
}

@JsonSerializable()
class QuizResponse {
  int code;
  dynamic result;
  String? message;

  QuizResponse({required this.code, this.result, this.message});

  factory QuizResponse.fromJson(Map<String, dynamic> json) => _$QuizResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResponseToJson(this);
}

@JsonSerializable()
class QuizResp {
  Quiz quiz;

  QuizResp({required this.quiz});

  factory QuizResp.fromJson(Map<String, dynamic> json) => _$QuizRespFromJson(json);
}