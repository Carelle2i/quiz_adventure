import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'quiz_screen.dart';

class FlashCardScreen extends StatefulWidget {
  final List<dynamic> cards;
  final String topicName;
  final String playerName;

  FlashCardScreen({
    required this.cards,
    required this.topicName,
    required this.playerName,
  });

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  late List<dynamic> _shuffledCards;

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
                        value: 1 - (45 / 100),
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
                      child: FlipCard(
                        front: _buildCardFace(
                          text: card.text,
                          topicName: widget.topicName,
                          currentIndex: index + 1,
                          totalCards: _shuffledCards.length,
                        ),
                        back: _buildCardFace(
                          text: 'Tap to Flip',
                          topicName: widget.topicName,
                          currentIndex: index + 1,
                          totalCards: _shuffledCards.length,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _shuffleCards,
                child: const Text("Reorder Cards"),
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
                        questionlenght: widget.cards,
                        optionsList: widget.cards.map((q) => q.options).toList(),
                        topicType: widget.topicName,
                        playerName: widget.playerName,
                      ),
                    ),
                  );
                },
                child: const Text("Start Quiz"),
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

  Widget _buildCardFace({
    required String text,
    required String topicName,
    required int currentIndex,
    required int totalCards,
  }) {
    const Color cardColor = Color(0xFF4993FA);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.24),
                blurRadius: 20.0,
                offset: const Offset(0.0, 10.0),
                spreadRadius: 10,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      topicName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                    ),
                    Text(
                      "$currentIndex/$totalCards",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Text(
                  "Tap to Flip",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: -120,
          top: 30,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: cardColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -100,
          bottom: 20,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: cardColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
