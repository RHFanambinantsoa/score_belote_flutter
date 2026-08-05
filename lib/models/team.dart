import 'package:score_belote/enums/team_type.dart';
// import 'package:isar/isar.dart';

// part 'team.g.dart';

// @embedded
class Team {
  // @Enumerated(EnumType.name)
  late TeamType teamType;

  late String label;

  Team({this.teamType = TeamType.teamA, this.label = ''});
}


  // Map<String, dynamic> toJson() {
  //   return {"teamType": teamType.name, "label": label};
  // }

  // factory Team.fromJson(Map<String, dynamic> json) {
  //   //transforme le json en objet
  //   return Team(
  //     teamType: TeamType.values.firstWhere(
  //       //firstWhere indique Cherche dans la liste la première valeur dont le nom correspond à json["teamType"].
  //       (e) => e.name == json["teamType"],
  //       // //Si tu trouves une valeur, retourne-la.
  //       // orElse: () => TeamType.teamA,
  //       // //Sinon, utilise cette valeur par défaut.
  //     ),
  //     label: json["label"],
  //   );
  // }

