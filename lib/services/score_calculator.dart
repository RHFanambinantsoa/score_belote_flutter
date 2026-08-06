import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team_score.dart';

TeamScore calculateScores(ScoreParameters params) {
  TeamScore scores = TeamScore(teamA: 0, teamB: 0);
  if (params.isSplit && params.splitValue != null) {
    scores.teamA = params.winner == TeamType.teamA
        ? params.splitValue!.callerScore
        : params.splitValue!.defenderScore;
    scores.teamB = params.winner == TeamType.teamB
        ? params.splitValue!.callerScore
        : params.splitValue!.defenderScore;
  } else {
    int winnerScore = 0;
    if (params.isCapot) {
      winnerScore = _getCapotScore(params.gameVariant, params.isDedans);
    } else {
      winnerScore = params.gameVariant.baseScore;
    }
    winnerScore *= params.roundStatus.multiplifier;
    scores.teamA = params.winner == TeamType.teamA ? winnerScore : 0;
    scores.teamB = params.winner == TeamType.teamB ? winnerScore : 0;
  }
  return scores;
}

int _getCapotScore(GameVariant gameVariant, bool isDedans) {
  int score = 0;
  switch (gameVariant) {
    case GameVariant.allTrump:
      score = ScoreConstants.allTrumpCapotScore;
      break;
    case GameVariant.noTrump:
      score = isDedans
          ? ScoreConstants.noTrumpCapotDefendingTeamScore
          : ScoreConstants.noTrumpCapotCallerTeamScore;
      break;
    default:
      score = ScoreConstants.colorCapotScore;
  }
  return score;
}
