import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/split_score.dart';

class GameSettings {
  bool allowSplit = true; //tout A mizara
  List<SplitScore> allowedSplits =
      ScoreConstants.communSplitAllTrumpScores; // liste ny fizarana
  bool allowClubsRedouble = false; // trèfle surcontré rava
  bool allowNoTrumpRedouble = false; //sans A surcontré rava
  bool allowVictoryWithSuitsCapot = true; //tout A capot dedans maty?
  bool allowVictoryWithAllTrumpCapotDedans = false; //tout A capot dedans maty?

  GameSettings();

  GameSettings.create({
    required this.allowSplit,
    required this.allowClubsRedouble,
    required this.allowNoTrumpRedouble,
    required this.allowVictoryWithAllTrumpCapotDedans,
    required this.allowVictoryWithSuitsCapot,
  });

  List<SplitScore> get orderedAllowedSplits {
    return [...allowedSplits]
      ..sort((a, b) => a.defenderScore.compareTo(b.defenderScore));
  }
}
