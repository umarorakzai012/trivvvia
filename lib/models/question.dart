import 'dart:developer';

import 'package:html_unescape/html_unescape_small.dart';

class QuestionModel {
  final String type;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuestionModel({
    required this.type,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    var unescape = HtmlUnescape();
    List<String> ica = [
      for (var incorrectAnswer in map['incorrect_answers'])
        unescape.convert(incorrectAnswer)
    ];
    return QuestionModel(
      type: unescape.convert(map['type']),
      question: unescape.convert(map['question']),
      correctAnswer: unescape.convert(map['correct_answer']),
      incorrectAnswers: ica,
    );
  }
}
