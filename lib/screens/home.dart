import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivvvia/models/question.dart';
import 'package:trivvvia/provider/provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<QuestionModel>> allQuestions =
        ref.watch(questionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivvvia'),
      ),
      body: switch (allQuestions) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Text(value[index].question);
            },
          ),
        AsyncError(:final error) =>
          Text('Error getting trivia! ${error.toString()}'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
