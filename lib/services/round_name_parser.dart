import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';

String shortRoundResume(
  GameVariant gameVariant,
  RoundStatus roundStatus,
  bool isCapot,
  bool isDedans,
) {
  final shortGameVariant = gameVariant.abbreviation;
  final details = [
    if (roundStatus != RoundStatus.normal) roundStatus.abbreviation,
    if (isCapot) AppStrings.capotAbbreviation,
    if (isDedans) AppStrings.dedansAbbreviation,
  ];
  if (details.isEmpty) {
    return shortGameVariant;
  }
  return "$shortGameVariant | ${details.join(" ")}";
}

String longRoundNameResume(GameVariant gameVariant, RoundStatus roundStatus) {
  return roundStatus == RoundStatus.normal
      ? "${gameVariant.suitSymbol}${gameVariant.label}"
      : "${gameVariant.suitSymbol}${gameVariant.label} - ${roundStatus.label}";
}

String capotStatus(bool isCapot, bool isDedans) {
  return isCapot
      ? (isDedans
            ? "${AppStrings.capot} ${AppStrings.dedans}"
            : AppStrings.capot)
      : "";
}
