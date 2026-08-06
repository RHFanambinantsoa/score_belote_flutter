import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/split_score.dart';

class TeamScore {
  int teamA;
  int teamB;
  TeamScore({required this.teamA, required this.teamB});
}

class ScoreParameters {
  GameVariant gameVariant; //toutA
  RoundStatus roundStatus; //contré
  late bool isCapot; //capot
  late bool isDedans; //dedans
  late bool isSplit; //split
  SplitScore? splitValue; //6-20
  TeamType winner; //si un gagant

  ScoreParameters({
    required this.winner,
    required this.gameVariant,
    required this.roundStatus,
    required this.isSplit,
    this.isCapot = false,
    this.isDedans = false,
    this.splitValue,
  });
}
