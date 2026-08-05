import 'package:score_belote/models/split_score.dart';

class GameSettings {
  bool allowSplit = false; //tout A mizara
  List<SplitScore> allowedSplits = []; // liste ny fizarana
  bool allowClubsRedouble = false; // trèfle surcontré rava
  bool allowNoTrumpRedouble = false; //sans A surcontré rava
  bool allTrumpCapotDedansEndGame = false; //tout A capot dedans maty?

  GameSettings();

  GameSettings.create({
    required this.allowSplit,
    required this.allowClubsRedouble,
    required this.allowNoTrumpRedouble,
    required this.allTrumpCapotDedansEndGame,
  });

  List<SplitScore> get orderedAllowedSplits {
    return [...allowedSplits]
      ..sort((a, b) => a.defenderScore.compareTo(b.defenderScore));
  }
}
