import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/option_types.dart';
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

  //Getters
  bool get isDrawAtTarget => //les deux équipes ont dépassé l'objectif
      totalScoreA >= targetScore && totalScoreB >= targetScore;

  bool get hasReachedTargetScore => //un équipe à attenit l'objectif
      totalScoreA >= targetScore || totalScoreB >= targetScore;

  int get totalScoreA => _totalScore(TeamType.teamA);
  //C'est un getter Dart. Un getter ressemble à une propriété, mais il exécute du code.
  //on pourrait ecire game.totalScoreB pour récupérer le score total de l'équipe B au lieu de game.totalScoreB() comme une méthode.

  int get totalScoreB => _totalScore(TeamType.teamB);
  List<Team> get teams => [teamA, teamB];

  GameResultType get gameResultType {
    if (status == GameStatus.abandoned) {
      return GameResultType.abandoned;
    } else {
      Round lastRound = rounds.last;
      if (rounds.isNotEmpty &&
          status == GameStatus.finished &&
          lastRound.isCapot &&
          ((lastRound.gameVariant.isSuit &&
                  settings.isCapotVictoryAllowed(CapotVictoryType.suits)) ||
              (lastRound.gameVariant == GameVariant.allTrump &&
                  settings.isCapotVictoryAllowed(
                    CapotVictoryType.allTrumpDedans,
                  )))) {
        return GameResultType.capotVictory;
      } else {
        return GameResultType.classicVictory;
      }
    }
  }

  String get createdDateLabel {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(startedAt.year, startedAt.month, startedAt.day);
    final difference = today.difference(dateOnly).inDays;
    if (difference == 0) {
      return "Aujourd'hui";
    }
    if (difference == 1) {
      return "Hier";
    }
    const months = [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre",
    ];
    return "${startedAt.day} ${months[startedAt.month - 1]}"
        "${startedAt.year != now.year ? " ${startedAt.year}" : ""}";
  }

  String get createdTime {
    final hour = startedAt.hour.toString().padLeft(2, '0');
    final minute = startedAt.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  String get durationLabel {
    if (endedAt == null) return '';
    return _formatDuration(startedAt, endedAt!);
  }

  String get gameResultLabel {
    switch (gameResultType) {
      case GameResultType.abandoned:
        return HistoryStrings.abandonnedGame;

      case GameResultType.capotVictory:
        return "${HistoryStrings.capotVictory} "
            "${rounds.last.gameVariant.isSuit ? "👉 Couleur ${rounds.last.gameVariant.abbreviation}" : "${rounds.last.gameVariant.abbreviation} Dedans"}";

      case GameResultType.classicVictory:
        return HistoryStrings.classicVictory;
    }
  }

  //ACTIONS
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

  void resumeGame() {
    if (status != GameStatus.abandoned) return;
    winner = null;
    status = GameStatus.running;
    endedAt = null;
  }

  //Private methods
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

  TeamType? _winner() {
    if (totalScoreA > totalScoreB) return TeamType.teamA;
    if (totalScoreB > totalScoreA) return TeamType.teamB;
    return null;
  }

  String _formatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);

    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (days > 0) {
      return '${days}j${hours}h${minutes.toString().padLeft(2, '0')}mn';
    }

    if (hours > 0) {
      return '${hours}h${minutes.toString().padLeft(2, '0')}mn';
    }
    if (minutes > 0) {
      return '${minutes}mn';
    }
    return '${seconds}s';
  }
}
