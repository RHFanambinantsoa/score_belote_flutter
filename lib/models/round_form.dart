import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/models/round.dart';

class RoundForm {
  GameVariant gameVariant;
  RoundStatus roundStatus;
  bool isCapot;
  bool isDedans;
  TeamType winnerTeam;
  bool isSplit;
  SplitScore splitScore;

  RoundForm({
    this.gameVariant = GameVariant.clubs,
    this.roundStatus = RoundStatus.normal,
    this.isCapot = false,
    this.isDedans = false,
    this.winnerTeam = TeamType.teamA,
    this.isSplit = false,
    required this.splitScore,
  });

  Round toRound() {
    return Round.create(
      teamAScore: 0,
      teamBScore: 0,
      gameVariant: gameVariant,
      roundStatus: roundStatus,
      isCapot: isCapot,
      isDedans: isDedans,
    );
  }
}
