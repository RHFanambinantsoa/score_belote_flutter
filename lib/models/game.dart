class Game {
  final String teamA;
  final String teamB;

  int scoreA;
  int scoreB;

  Game({
    required this.teamA,
    required this.teamB,
    this.scoreA = 0,
    this.scoreB = 0,
  });
}
