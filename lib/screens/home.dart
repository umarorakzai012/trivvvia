import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: GoogleFonts.robotoMono(
            textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: switch (allQuestions) {
        AsyncData(:final value) => SafeArea(
            child: ListView(
              children: [
                ...value.map(
                  (question) => QuestionCard(question),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Text('Submit'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        AsyncError(:final error) =>
          Text('Error getting trivia! ${error.toString()}'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
