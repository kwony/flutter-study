// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_question_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _QuizApiClient implements QuizApiClient {
  _QuizApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://trotking-api.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<QuizResponse> getQuiz(quizId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'quizId': quizId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuizResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/v1/quiz',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QuizResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
