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
    return QuestionModel(
      type: map['type'],
      question: map['question'],
      correctAnswer: map['correct_answer'],
      incorrectAnswers: map['incorrect_answers'],
    );
  }
}
