import 'package:flutter/material.dart';
import 'package:quiz_adventure/widgets/dotted_lines.dart';

class ResultsCard extends StatelessWidget {
  const ResultsCard({
    super.key,
    required this.roundedPercentageScore,
    required this.bgColor3,
    required this.playerName,
    required this.playerScore,
  });

  final int roundedPercentageScore;
  final Color bgColor3;
  final String playerName;
  final int playerScore;

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.888,
      height: MediaQuery.of(context).size.height * 0.568,
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            for (var ii = 0;
                                ii < "Félicitation!,".length;
                                ii++) ...[
                              TextSpan(
                                text: "Félicitation!,"[ii],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 12 + ii.toDouble()),
                              ),
                            ],
                            TextSpan(
                              text: "\n$playerName\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: "Ton Score est de \n",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: "$playerScore ($roundedPercentageScore%)",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 30,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: DrawDottedhorizontalline(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: roundedPercentageScore >= 75
                            ? Column(
                                children: [
                                  Text(
                                    "Tu as mérité ce trophé",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Image.asset("assets/bouncy-cup.gif",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Je sais que tu peux faire mieux que ça!!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Image.asset("assets/sad.png",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor3, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor3, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
