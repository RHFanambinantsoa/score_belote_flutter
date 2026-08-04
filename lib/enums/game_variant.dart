enum GameVariant {
  clubs("Trèfle", 32),
  diamonds("Carreau", 16),
  hearts("Cœur", 16),
  spades("Pique", 16),
  noTrump("SansA", 52),
  allTrump("ToutA", 26);

  final String label;
  final int baseScore;

  const GameVariant(this.label, this.baseScore);
  //comme ça on peut faire GameVariant.clubs.label pour récupérer le label "Trèfle", et le score de base avec GameVariant.clubs.baseScore pour récupérer le score de base 32
}
