import 'package:flutter/cupertino.dart';

class RoadCodeOption {
  final String text;
  final bool isCorrect;

  const RoadCodeOption({
    required this.text,
    required this.isCorrect,
  });
}

class RoadCodeQuestion {
  final int id;
  final String text;
  final List<RoadCodeOption> options;
  bool isLocked;
  RoadCodeOption? selectedOption;
  RoadCodeOption? correctAnswer;

  RoadCodeQuestion({
    required this.id,
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
    required this.correctAnswer,
  });

  RoadCodeQuestion copyWith() {
    return RoadCodeQuestion(
      id: id,
      text: text,
      options: options
          .map((option) => RoadCodeOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedOption: selectedOption,
      correctAnswer: correctAnswer,
    );
  }
}

class RoadCodeCategory {
  final int id;
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;
  final List<RoadCodeQuestion> questions;

  RoadCodeCategory({
    required this.id,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
    required this.questions,
  });
}
