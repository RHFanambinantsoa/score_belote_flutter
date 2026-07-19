import 'package:score_belote/enums/team_type.dart';

class Team {
  TeamType teamType;
  String label;

  Team({required this.teamType, required this.label});

  Map<String, dynamic> toJson() {
    return {"teamType": teamType, "label": label};
  }
}
