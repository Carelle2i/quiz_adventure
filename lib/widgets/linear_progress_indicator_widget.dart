import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_adventure/models/road_code_model.dart';
import 'package:quiz_adventure/views/quiz_screen.dart';

class MyProgressIndicator extends StatefulWidget {
  final List<dynamic> questions;
    final List<RoadCodeQuestion> cards;

  final dynamic optionsList;
  final String topicType;
  final String playerName;

  const MyProgressIndicator({
    Key? key,
    required this.questions,
    required this.cards,

    required this.optionsList,
    required this.topicType,
    required this.playerName,
  }) : super(key: key);

  @override
  _MyProgressIndicatorState createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  int remainingSeconds = 45;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          _timer?.cancel();
          _navigateToQuizScreen();
        }
      });
    });
  }

  void _navigateToQuizScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          questions: widget.cards,
          optionsList: widget.optionsList,
          topicType: widget.topicType,
          playerName: widget.playerName,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color progressBarColor = Color(0xFF4993FA);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LinearProgressIndicator(
        minHeight: 20,
        value: 1 - (remainingSeconds / 45),
        backgroundColor: Colors.blue.shade100,
        color: Colors.blueGrey,
        valueColor: const AlwaysStoppedAnimation(progressBarColor),
      ),
    );
  }
}
