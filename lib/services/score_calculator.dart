import 'package:score_belote/models/round.dart';

int calculateScoreToAdd(Round round) {
  print("ajout");
  return round.gameVariant.baseScore * round.roundStatus.multiplifier;
}
