import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team.dart';

import '../enums/game_variant.dart';
import '../enums/round_status.dart';

class Round {
  GameVariant gameVariant;
  RoundStatus roundStatus;
  bool isCapot;
  Team winnerTeam;
  int score;

  Round({
    required this.gameVariant,
    required this.roundStatus,
    required this.isCapot,
    required this.winnerTeam,
    required this.score,
  });

  factory Round.empty() {
    // Return a default round with some default values
    return Round(
      gameVariant: GameVariant.clubs,
      roundStatus: RoundStatus.normal,
      isCapot: false,
      winnerTeam: Team(label: "EquipeA", teamType: TeamType.teamA),
      score: GameVariant.clubs.baseScore,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "gameVariant": gameVariant,
      "roundStatus": roundStatus,
      "isCapot": isCapot,
      "winnerTeam": winnerTeam,
      "score": score,
    };
  }
}
