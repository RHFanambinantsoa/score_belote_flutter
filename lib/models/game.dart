import 'round.dart';
import '../enums/team.dart';

class Game {
  final String teamA;
  final String teamB;

  List<Round> rounds;

  Game({required this.teamA, required this.teamB, List<Round>? rounds})
    : rounds = rounds ?? [];

  //explication du constructeur :
  //si on ne passe pas de liste de rounds, on initialise la liste à une liste vide.
  //Sinon, on initialise la liste avec la liste passée en paramètre.

  //constructor initializer list fait que rounds est initialisé avant le corps du constructeur.

  int _totalScore(Team team) {
    return rounds
        .where((round) => round.winnerTeam == team)
        //where: équivalent à filter dans typescript
        .map((round) => round.score)
        .fold(0, (total, score) => total + score);
    //fold, accumulateur equivalent à reduce()
    //argument1: 0 valeur de départ => total=0
    //argument2: fonction qui prend en paramète l'accumulateur total et l'élément courant de la liste
  }

  List<Round> _groupRoundsByTeam(Team team) {
    return rounds.where((r) => r.winnerTeam == team).toList();
  }

  int get totalScoreA => _totalScore(Team.teamA);
  //C'est un getter Dart. Un getter ressemble à une propriété, mais il exécute du code.
  //on pourrait ecire game.totalScoreB pour récupérer le score total de l'équipe B au lieu de game.totalScoreB() comme une méthode.

  int get totalScoreB => _totalScore(Team.teamB);
  List<Round> get teamARounds => _groupRoundsByTeam(Team.teamA);
  List<Round> get teamBRounds => _groupRoundsByTeam(Team.teamB);
}
