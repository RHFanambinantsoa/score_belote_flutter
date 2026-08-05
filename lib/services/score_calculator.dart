import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/models/split_score.dart';

Round calculateRoundScoresToAdd(
  Round round,
  TeamType? teamSelected,
  bool? isSplit,
  SplitScore? selectedSplitScore,
) {
  if (isSplit == true && selectedSplitScore != null) {
    round.gameVariant = GameVariant.allTrump;
    round.roundStatus = RoundStatus.normal;
    round.isCapot = false;
    round.teamAScore = teamSelected == TeamType.teamA
        ? selectedSplitScore.callerScore
        : selectedSplitScore.defenderScore;
    round.teamBScore = teamSelected == TeamType.teamB
        ? selectedSplitScore.callerScore
        : selectedSplitScore.defenderScore;
  } else {
    int score = 0;
    if (!round.isCapot) {
      score = round.gameVariant.baseScore;
    } else {
      switch (round.gameVariant) {
        case GameVariant.allTrump:
          score = ScoreConstants.allTrumpCapotScore;
          break;
        case GameVariant.noTrump:
          score = round.isDedans
              ? ScoreConstants.noTrumpCapotDefendingTeamScore
              : ScoreConstants.noTrumpCapotCallerTeamScore;
          break;
        default:
          score = ScoreConstants.colorCapotScore;
      }
    }
    score *= round.roundStatus.multiplifier;
    round.teamAScore = teamSelected == TeamType.teamA ? score : 0;
    round.teamBScore = teamSelected == TeamType.teamB ? score : 0;
  }
  return round;
}
