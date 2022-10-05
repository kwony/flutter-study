// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      quizId: json['quizId'] as int?,
      answer: json['answer'] as String?,
      quizContent: json['quizContent'] == null
          ? null
          : QuizContent.fromJson(json['quizContent'] as Map<String, dynamic>),
      level: json['level'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'quizId': instance.quizId,
      'answer': instance.answer,
      'quizContent': instance.quizContent,
      'level': instance.level,
      'type': instance.type,
    };

QuizContent _$QuizContentFromJson(Map<String, dynamic> json) => QuizContent(
      question: json['question'] as String?,
      answerList: (json['answerList'] as List<dynamic>)
          .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaPath: json['mediaPath'] as String?,
    );

Map<String, dynamic> _$QuizContentToJson(QuizContent instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answerList': instance.answerList,
      'mediaPath': instance.mediaPath,
    };

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) => QuizAnswer(
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$QuizAnswerToJson(QuizAnswer instance) =>
    <String, dynamic>{
      'answer': instance.answer,
    };

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) => QuizResponse(
      code: json['code'] as int,
      result: json['result'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$QuizResponseToJson(QuizResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'message': instance.message,
    };

QuizResp _$QuizRespFromJson(Map<String, dynamic> json) => QuizResp(
      quiz: Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizRespToJson(QuizResp instance) => <String, dynamic>{
      'quiz': instance.quiz,
    };
