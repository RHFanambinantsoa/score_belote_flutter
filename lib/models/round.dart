import 'package:isar/isar.dart';
// Import des annotations et types nécessaires pour utiliser Isar
// (@collection, Id, @Enumerated...)

import 'package:score_belote/enums/team_type.dart';

import '../enums/game_variant.dart';
import '../enums/round_status.dart';

part 'round.g.dart';
// Indique qu'un fichier généré automatiquement par Isar complète cette classe.
// Le fichier team.g.dart sera créé avec build_runner.

// @collection Indique à Isar que cette classe est une donnée persistante.
// Chaque objet Team pourra être enregistré dans la base.
@collection
class Round {
  Id id = Isar.autoIncrement;
  // Identifiant unique généré automatiquement par Isar.
  // Comparable à une clé primaire en base de données.

  @Enumerated(EnumType.name)
  // @Enumerated(EnumType.name): Indique à Isar comment sauvegarder l'enum.
  // Indique à Isar de sauvegarder l'enum avec son nom.
  // Exemple : TeamType.teamA devient "teamA"
  // Cela évite les problèmes si l'ordre des valeurs de l'enum change.
  late GameVariant gameVariant;

  @Enumerated(EnumType.name)
  late RoundStatus roundStatus;

  @Enumerated(EnumType.name)
  late TeamType winnerTeam;

  late bool isCapot;
  late bool isDefending;
  late int score;

  Round({
    required this.gameVariant,
    required this.roundStatus,
    required this.isCapot,
    required this.isDefending,
    required this.winnerTeam,
    required this.score,
  });

  factory Round.empty() {
    // Return a default round with some default values
    return Round(
      gameVariant: GameVariant.clubs,
      roundStatus: RoundStatus.normal,
      isCapot: false,
      isDefending: false,
      winnerTeam: TeamType.teamA,
      score: GameVariant.clubs.baseScore,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "gameVariant": gameVariant.name,
      //.name change la veleur d'un enum en string (type)
      "roundStatus": roundStatus.name,
      "isCapot": isCapot,
      "isDefending": isDefending,
      "winnerTeam": winnerTeam.name,
      "score": score,
    };
  }

  factory Round.fromJson(Map<String, dynamic> json) {
    //transforme le json en objet
    return Round(
      gameVariant: GameVariant.values.firstWhere(
        (e) => e.name == json["gameVariant"],
      ),
      roundStatus: RoundStatus.values.firstWhere(
        (e) => e.name == json["roundStatus"],
      ),
      isCapot: json["isCapot"],
      isDefending: json["isDefending"],
      winnerTeam: TeamType.values.firstWhere(
        (e) => e.name == json["winnerTeam"],
      ),
      score: json["score"],
    );
  }
}
