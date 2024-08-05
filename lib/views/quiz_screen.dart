import 'package:flutter/material.dart';
import 'package:quiz_adventure/models/road_code_model.dart';
import 'package:quiz_adventure/views/results_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<RoadCodeQuestion> questions;
  final String topicType;
  final String playerName;

  const QuizScreen({
    Key? key,
    required this.questions,
    required this.topicType,
    required this.playerName, required optionsList,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 0;
  int _score = 0;
  bool _isLocked = false;

  void _nextQuestion() {
    if (_questionNumber < widget.questions.length - 1) {
      setState(() {
        _questionNumber++;
        _isLocked = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            score: _score,
            totalQuestions: widget.questions.length,
            whichTopic: widget.topicType,
            playerName: widget.playerName,
          ),
        ),
      );
    }
  }

  void _selectOption(RoadCodeOption option) {
    if (_isLocked) return;

    setState(() {
      widget.questions[_questionNumber].isLocked = true;
      widget.questions[_questionNumber].selectedOption = option;
      _isLocked = true;

      if (option.isCorrect) {
        _score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_questionNumber];
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topicType} Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Question ${_questionNumber + 1}/${widget.questions.length}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              question.text,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            for (var option in question.options)
              GestureDetector(
                onTap: () => _selectOption(option),
                child: Container(
                  decoration: BoxDecoration(
                    color: option == question.selectedOption
                        ? (option.isCorrect ? Colors.green : Colors.red)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        option.text,
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      if (question.isLocked)
                        Icon(
                          option.isCorrect ? Icons.check : Icons.close,
                          color: option.isCorrect ? Colors.green : Colors.red,
                        ),
                    ],
                  ),
                ),
              ),
            Spacer(),
            if (question.isLocked)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(_questionNumber < widget.questions.length - 1
                    ? 'Prochaine Question'
                    : 'Résultats'),
              ),
          ],
        ),
      ),
    );
  }
}
