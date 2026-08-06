import 'package:score_belote/constants/app_strings.dart';

enum RoundStatus {
  normal("Normal", 1, ''),
  doubled("Contré", 2, AppStrings.doubledAbbreviation),
  redoubled("Surcontré", 4, AppStrings.redoubledAbbreviation);

  final String label;
  final int multiplifier;
  final String abbreviation;
  const RoundStatus(this.label, this.multiplifier, this.abbreviation);

  static List<RoundStatus> get withoutRedoubled =>
      values.sublist(0, values.length - 1);
}
