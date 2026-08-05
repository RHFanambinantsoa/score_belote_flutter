import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team.dart';
import 'round.dart';

class Game {
  late DateTime startedAt;
  DateTime? finishedAt;
  int targetScore = ScoreConstants.targetScore;
  TeamType? winner;
  List<Round> rounds = [];
  late Team teamA;
  late Team teamB;
  late GameStatus status;

  Game();

  Game.create({
    required this.teamA,
    required this.teamB,
    this.targetScore = ScoreConstants.targetScore,
  }) {
    startedAt = DateTime.now();
    status = GameStatus.running;
  }

  int _totalScore(TeamType teamType) {
    return rounds
        .where((round) => round.winnerTeam == teamType)
        //where: équivalent à filter dans typescript
        .map((round) => round.score)
        .fold(0, (total, score) => total + score);

    //fold, accumulateur equivalent à reduce()
    //argument1: 0 valeur de départ => total=0
    //argument2: fonction qui prend en paramète l'accumulateur total et l'élément courant de la liste
  }

  List<Round> _groupRoundsByTeam(TeamType teamType) {
    return rounds.where((r) => r.winnerTeam == teamType).toList();
  }

  int get totalScoreA => _totalScore(TeamType.teamA);
  //C'est un getter Dart. Un getter ressemble à une propriété, mais il exécute du code.
  //on pourrait ecire game.totalScoreB pour récupérer le score total de l'équipe B au lieu de game.totalScoreB() comme une méthode.

  int get totalScoreB => _totalScore(TeamType.teamB);
  List<Round> get teamARounds => _groupRoundsByTeam(TeamType.teamA);
  List<Round> get teamBRounds => _groupRoundsByTeam(TeamType.teamB);
  List<Team> get teams => [teamA, teamB];

  void finishGame(TeamType winnerTeam) {
    if (status != GameStatus.running) return;
    winner = winnerTeam;
    status = GameStatus.finished;
    finishedAt = DateTime.now();
  }

  void abandonGame() {
    if (status != GameStatus.running) return;
    winner = null;
    status = GameStatus.abandoned;
    finishedAt = DateTime.now();
  }
}
