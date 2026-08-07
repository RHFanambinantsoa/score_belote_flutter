import 'package:score_belote/constants/app_strings.dart';

enum GameVariant {
  clubs("Trèfle", AppStrings.clubsSymbol, 32, 50, 70),
  diamonds("Carreau", AppStrings.diamondsSymbol, 16, 25, 35),
  hearts("Cœur", AppStrings.heartsSymbol, 16, 25, 35),
  spades("Pique", AppStrings.spadesSymbol, 16, 25, 35),
  noTrump("SansA", AppStrings.noTrumpAbbreviation, 52, 70, 90),
  allTrump("ToutA", AppStrings.allTrumpAbbreviation, 26, 35, 45);

  final String label;
  final int baseScore;
  final int capotScore;
  final int capotDedansScore;
  final String abbreviation;

  const GameVariant(
    this.label,
    this.abbreviation,
    this.baseScore,
    this.capotScore,
    this.capotDedansScore,
  );

  bool get isRed => this == GameVariant.diamonds || this == GameVariant.hearts;

  bool get isSuit =>
      this != GameVariant.allTrump && this != GameVariant.noTrump;

  String get suitSymbol => isSuit ? abbreviation : "";
}
