import 'package:flutter/material.dart';
import 'package:quiz_adventure/models/road_code_model.dart';
import 'package:quiz_adventure/widgets/flash_card_widget.dart';
import 'quiz_screen.dart';

class FlashCardScreen extends StatefulWidget {
  final List<RoadCodeQuestion> cards;
  final dynamic optionsList;
  final String topicName;
  final String playerName;

  FlashCardScreen({
    required this.cards,
    required this.optionsList,
    required this.topicName,
    required this.playerName,
  });

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  late List<RoadCodeQuestion> _shuffledCards;

  @override
  void initState() {
    super.initState();
    _shuffledCards = List.from(widget.cards);
  }

  void _shuffleCards() {
    setState(() {
      _shuffledCards.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color cardColor = Color(0xFF4993FA);

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: AppBar(
        backgroundColor: bgColor3,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        minHeight: 20,
                        value: 1 - (_shuffledCards.length / 100),
                        backgroundColor: Colors.blue.shade100,
                        color: Colors.blueGrey,
                        valueColor: const AlwaysStoppedAnimation(cardColor),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  itemCount: _shuffledCards.length,
                  itemBuilder: (context, index) {
                    final card = _shuffledCards[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FlipCardsWidget(
                        bgColor: cardColor,
                        currentIndex: index + 1,
                        cardsLength: _shuffledCards.length,
                        question: card.text,
                        answer: card.correctAnswer.text,
                        currentTopic: widget.topicName,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _shuffleCards,
                child: const Text("Mélanger les Cards"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.80, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        questions: widget.cards,
                        topicType: widget.topicName,
                        playerName: widget.playerName, 
                        optionsList: widget.optionsList,
                      ),
                    ),
                  );
                },
                child: const Text("Commencer le Quiz"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.80, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
