import 'package:flutter/material.dart';
import 'package:quiz_adventure/models/road_code_questions.dart';
import 'package:quiz_adventure/views/flashcard_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  String? playerName;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bgColor3,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: -10,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Image.asset("assets/dash.png"), 
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: playerName == null
                    ? Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Entrez votre nom',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                playerName = _nameController.text;
                              });
                            },
                            child: const Text('Commencer'),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Bienvenue, $playerName ! ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize: 21,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                for (var i = 0;
                                    i < "En route vers le permis!".length;
                                    i++) ...[
                                  TextSpan(
                                    text: "En route vers le permis!"[i],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 21 + i.toDouble(),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ]
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.85,
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: roadCodeCategories.length,
                            itemBuilder: (context, index) {
                              final category = roadCodeCategories[index];
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Confirmation"),
                                      content: Text(
                                          "Voulez-vous commencer la catégorie ${category.categoryName}?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Annuler"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FlashCardScreen(
                                                  cards: category.questions,
                                                  topicName:
                                                      category.categoryName,
                                                  playerName: playerName!,
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text("Commencer"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Card(
                                  color: bgColor,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          category.categoryIcon,
                                          color: Colors.white,
                                          size: 55,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          category.categoryName,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
