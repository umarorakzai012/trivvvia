import 'package:flutter/material.dart';
import 'package:trivvvia/models/question.dart';

class QuestionCard extends StatefulWidget {
  final QuestionModel question;
  const QuestionCard(this.question, {super.key});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String userAnswer = '';

  @override
  Widget build(BuildContext context) {
    List<String> choices = [
      ...widget.question.incorrectAnswers,
      widget.question.correctAnswer
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card.filled(
        elevation: 5,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
              child: Text(
                widget.question.question,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 5),
            for (var choice in choices)
              RadioListTile(
                title: Text(choice),
                value: choice,
                groupValue: userAnswer,
                onChanged: (String? value) {
                  if (value == null) return;
                  setState(() {
                    userAnswer = value;
                  });
                },
              ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
