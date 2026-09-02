import 'package:score_belote/enums/game_status.dart';

class FilterFields {
  final String team;
  final DateTime? date;
  final GameResultType? resultType;

  const FilterFields({required this.team, this.date, this.resultType});
}
