import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/models/team.dart';
import 'round.dart';

class Game {
  late DateTime startedAt;
  DateTime? endedAt;
  int targetScore = ScoreConstants.targetScore;
  TeamType? winner;
  List<Round> rounds = [];
  late Team teamA;
  late Team teamB;
  late GameStatus status;
  late GameSettings settings;

  Game();

  Game.create({
    required this.teamA,
    required this.teamB,
    this.targetScore = ScoreConstants.targetScore,
    required this.settings,
  }) {
    startedAt = DateTime.now();
    status = GameStatus.running;
  }

  int _totalScore(TeamType teamType) {
    return rounds.fold(
      //fold, accumulateur equivalent à reduce()
      //argument1: 0 valeur de départ => total=0
      //argument2: fonction qui prend en paramète l'accumulateur total et l'élément courant de la liste
      0,
      (total, round) =>
          total +
          (teamType == TeamType.teamA ? round.teamAScore : round.teamBScore),
    );
  }

  int get totalScoreA => _totalScore(TeamType.teamA);
  //C'est un getter Dart. Un getter ressemble à une propriété, mais il exécute du code.
  //on pourrait ecire game.totalScoreB pour récupérer le score total de l'équipe B au lieu de game.totalScoreB() comme une méthode.

  int get totalScoreB => _totalScore(TeamType.teamB);
  List<Team> get teams => [teamA, teamB];

  bool get isDrawAtTarget => //les deux équipes ont dépassé l'objectif
      totalScoreA >= targetScore && totalScoreB >= targetScore;

  bool get hasReachedTargetScore => //un équipe à attenit l'objectif
      totalScoreA >= targetScore || totalScoreB >= targetScore;

  TeamType? _winner() {
    if (totalScoreA > totalScoreB) return TeamType.teamA;
    if (totalScoreB > totalScoreA) return TeamType.teamB;
    return null;
  }

  void increaseTargetScore() {
    targetScore += ScoreConstants.targetIncrementInterval;
  }

  void deleteLastRound() {
    rounds = rounds.sublist(0, rounds.length - 1);
    status = GameStatus.running;
    winner = null;
  }

  void finishGame() {
    if (status != GameStatus.running) return;
    winner = _winner();
    status = GameStatus.finished;
    endedAt = DateTime.now();
  }

  void abandonGame() {
    if (status != GameStatus.running) return;
    winner = null;
    status = GameStatus.abandoned;
    endedAt = DateTime.now();
  }
}
