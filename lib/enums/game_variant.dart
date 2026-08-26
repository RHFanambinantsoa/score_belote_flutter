enum GameVariant {
  clubs("Trèfle", 32, 50, 70),
  diamonds("Carreau", 16, 25, 35),
  hearts("Cœur", 16, 25, 35),
  spades("Pique", 16, 25, 35),
  noTrump("SansA", 52, 70, 90),
  allTrump("ToutA", 26, 35, 45);

  final String label;
  final int baseScore;
  final int capotScore;
  final int capotDedansScore;

  const GameVariant(
    this.label,
    this.baseScore,
    this.capotScore,
    this.capotDedansScore,
  );

  bool get isRed => this == GameVariant.diamonds || this == GameVariant.hearts;

  bool get isSuit =>
      this != GameVariant.allTrump && this != GameVariant.noTrump;

  String get suitSymbol => isSuit ? abbreviation : "";

  String get abbreviation {
    switch (this) {
      case GameVariant.clubs:
        return '♣';
      case GameVariant.diamonds:
        return '♦';
      case GameVariant.hearts:
        return '♥';
      case GameVariant.spades:
        return '♠';
      case GameVariant.noTrump:
        return 'SA';
      default:
        return 'TA';
    }
  }
}
