import 'package:score_belote/constants/app_strings.dart';

enum GameVariant {
  clubs("Trèfle", 32, AppStrings.clubsSymbol),
  diamonds("Carreau", 16, AppStrings.diamondsSymbol),
  hearts("Cœur", 16, AppStrings.heartsSymbol),
  spades("Pique", 16, AppStrings.spadesSymbol),
  noTrump("SansA", 52, AppStrings.noTrumpAbbreviation),
  allTrump("ToutA", 26, AppStrings.allTrumpAbbreviation);

  final String label;
  final int baseScore;
  final String abbreviation;

  const GameVariant(this.label, this.baseScore, this.abbreviation);

  bool get isRed => this == GameVariant.diamonds || this == GameVariant.hearts;

  bool get hasSymbol =>
      this != GameVariant.allTrump && this != GameVariant.noTrump;

  String get suitSymbol => hasSymbol ? abbreviation : "";

  //comme ça on peut faire GameVariant.clubs.label pour récupérer le label "Trèfle", et le score de base avec GameVariant.clubs.baseScore pour récupérer le score de base 32
}
