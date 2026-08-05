// import 'package:isar/isar.dart';
// Import des annotations et types nécessaires pour utiliser Isar
// (@collection, Id, @Enumerated...)

import '../enums/game_variant.dart';
import '../enums/round_status.dart';

class Round {
  late GameVariant gameVariant;
  late RoundStatus roundStatus;
  bool isCapot = false;
  bool isDedans = false;
  int teamAScore = 0;
  int teamBScore = 0;

  Round();

  Round.create({
    required this.teamAScore,
    required this.teamBScore,
    required this.gameVariant,
    required this.roundStatus,
    required this.isCapot,
    required this.isDedans,
  });
}
