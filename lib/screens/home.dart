import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivvvia/models/question.dart';
import 'package:trivvvia/provider/provider.dart';
import 'package:trivvvia/widgets/question_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<QuestionModel>> allQuestions =
        ref.watch(questionsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Trivvvia',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: switch (allQuestions) {
        AsyncData(:final value) => SafeArea(
            child: ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return QuestionCard(value[index]);
              },
            ),
          ),
        AsyncError(:final error) =>
          Text('Error getting trivia! ${error.toString()}'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
