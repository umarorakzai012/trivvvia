import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvvia/models/question.dart';

part 'provider.g.dart';

@riverpod
Future<List<QuestionModel>> questions(QuestionsRef ref) async {
  await Future.delayed(Duration(seconds: 2));
  var uri = Uri.parse('https://opentdb.com/api.php?amount=10');
  final response = await http.get(uri);

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final questionList = json['results'] as List;

  List<QuestionModel> allQuestions = [];
  for (final Map<String, dynamic> question in questionList) {
    allQuestions.add(QuestionModel.fromMap(question));
  }

  return allQuestions;
}
