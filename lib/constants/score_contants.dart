import 'package:score_belote/models/split_score.dart';

class ScoreConstants {
  static const int allTrumpCapotScore = 35;
  static const int noTrumpCapotCallerTeamScore = 70;
  static const int noTrumpCapotDefendingTeamScore = 90;
  static const int colorCapotScore = 150;
  static const int targetScore = 150;
  static const int targetIncrementInterval = 50;
  static List<SplitScore> splitAllTrumpScores = [
    SplitScore(callerScore: 18, defenderScore: 8),
    SplitScore(callerScore: 16, defenderScore: 10),
    SplitScore(callerScore: 14, defenderScore: 12),
  ];
}
