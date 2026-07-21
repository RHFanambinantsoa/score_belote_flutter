import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team.dart';
import 'round.dart';

class Game {
  DateTime date;
  TeamType? winner;
  List<Round> rounds;
  late String teamALabel;
  late String teamBLabel;

  Game({
    required this.date,
    required this.teamALabel,
    required this.teamBLabel,
    this.winner,
    List<Round>? rounds,
  }) : rounds = rounds ?? [];

  //explication du constructeur :
  //si on ne passe pas de liste de rounds, on initialise la liste à une liste vide.
  //Sinon, on initialise la liste avec la liste passée en paramètre.

  //constructor initializer list fait que rounds est initialisé avant le corps du constructeur.

  int _totalScore(TeamType teamType) {
    return rounds
        .where((round) => round.winnerTeam == teamType)
        //where: équivalent à filter dans typescript
        .map((round) => round.score)
        .fold(0, (total, score) => total + score);

    //fold, accumulateur equivalent à reduce()
    //argument1: 0 valeur de départ => total=0
    //argument2: fonction qui prend en paramète l'accumulateur total et l'élément courant de la liste
  }

  List<Round> _groupRoundsByTeam(TeamType teamType) {
    return rounds.where((r) => r.winnerTeam == teamType).toList();
  }

  int get totalScoreA => _totalScore(TeamType.teamA);
  //C'est un getter Dart. Un getter ressemble à une propriété, mais il exécute du code.
  //on pourrait ecire game.totalScoreB pour récupérer le score total de l'équipe B au lieu de game.totalScoreB() comme une méthode.

  int get totalScoreB => _totalScore(TeamType.teamB);
  List<Round> get teamARounds => _groupRoundsByTeam(TeamType.teamA);
  List<Round> get teamBRounds => _groupRoundsByTeam(TeamType.teamB);
  List<Team> get teams => [
    Team(teamType: TeamType.teamA, label: teamALabel),
    Team(teamType: TeamType.teamB, label: teamBLabel),
  ];
  Team get teamA => Team(teamType: TeamType.teamA, label: teamALabel);

  Team get teamB => Team(teamType: TeamType.teamB, label: teamBLabel);

  Map<String, dynamic> toJson() {
    return {
      "date": date.toIso8601String(),
      "winner": winner?.name,
      "teamALabel": teamALabel,
      "teamBLabel": teamBLabel,
      "rounds": rounds.map((r) => r.toJson()).toList(),
    };
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      rounds: (json["rounds"] as List).map((r) => Round.fromJson(r)).toList(),
      date: DateTime.parse(json["date"]),
      teamALabel: json["teamALabel"],
      teamBLabel: json["teamBLabel"],
      winner: json["winner"] != null
          ? TeamType.values.firstWhere((e) => e.name == json["winner"])
          : null,
    );
  }
}
