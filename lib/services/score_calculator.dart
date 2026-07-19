import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/models/round.dart';

int calculateNormalScoreToAdd(Round round) {
  int baseScore = 0;
  if (!round.isCapot) {
    baseScore = round.gameVariant.baseScore;
  } else {
    switch (round.gameVariant) {
      case GameVariant.allTrump:
        baseScore = ScoreConstants.allTrumpCapotScore;
        break;
      case GameVariant.noTrump:
        baseScore = round.isDefending
            ? ScoreConstants.noTrumpCapotDefendingTeamScore
            : ScoreConstants.noTrumpCapotCallerTeamScore;
        break;
      default:
        baseScore = ScoreConstants.colorCapotScore;
    }
  }
  return baseScore * round.roundStatus.multiplifier;
}
