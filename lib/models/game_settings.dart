import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/constants/settings_strings.dart';
import 'package:score_belote/enums/option_types.dart';
import 'package:score_belote/models/capot_victory_option.dart';
import 'package:score_belote/models/redouble_option.dart';
import 'package:score_belote/models/split_score.dart';

class GameSettings {
  //toutA mizara
  bool allowSplit = true;

  //liste des valeurs de split
  List<SplitScore> allowedSplits = [
    ...ScoreConstants.communSplitAllTrumpScores,
  ]; //copie la liste sans la référence

  List<RedoubleOption> redoubleOptions = [
    //trèfle surcontré autorisé
    RedoubleOption(
      type: RedoubleType.clubs,
      label: SettingsStrings.allowClubsRedoubleScore,
      enabled: false,
    ),
    //sansA surcontré autorisé
    RedoubleOption(
      type: RedoubleType.noTrump,
      label: SettingsStrings.allowNoTrumpRedoubleScore,
      enabled: false,
    ),
  ];

  List<CapotVictoryOption> capotVictoryOptions = [
    //capot couleur => victoire
    CapotVictoryOption(
      type: CapotVictoryType.suits,
      label: SettingsStrings.suitsCapotVictory,
      enabled: false,
    ),
    //Capot Dedans toutA => victoire
    CapotVictoryOption(
      type: CapotVictoryType.allTrumpDedans,
      label: SettingsStrings.allTrumpCapotDedansVictory,
      enabled: false,
    ),
  ];

  GameSettings();

  GameSettings.create({required this.allowSplit});

  List<SplitScore> get orderedAllowedSplits {
    return [...allowedSplits]
      ..sort((a, b) => a.defenderScore.compareTo(b.defenderScore));
  }

  bool isRedoubleAllowed(RedoubleType type) {
    return redoubleOptions.firstWhere((option) => option.type == type).enabled;
  }

  void setRedouble(RedoubleType type, bool value) {
    redoubleOptions.firstWhere((option) => option.type == type).enabled = value;
  }

  bool isCapotVictoryAllowed(CapotVictoryType type) {
    return capotVictoryOptions
        .firstWhere((option) => option.type == type)
        .enabled;
  }

  void setCapotVictory(CapotVictoryType type, bool value) {
    capotVictoryOptions.firstWhere((option) => option.type == type).enabled =
        value;
  }
}
