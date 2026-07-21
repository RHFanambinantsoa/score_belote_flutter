import 'package:flutter/material.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/screens/score_screen.dart';
import 'package:score_belote/widgets/menu_button.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/widgets/team_input.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final teamAController = TextEditingController();
  final teamBController = TextEditingController();
  //textEditingController est un widget qui permet de récupérer la valeur d'un TextField
  String errorMessage = "";
  List<Team> teams = [];

  @override
  void dispose() {
    teamAController.dispose();
    teamBController.dispose();
    super.dispose();
  }

  void _validateTeams() {
    final teamALabel = teamAController.text.trim();
    final teamBLabel = teamBController.text.trim();

    if (teamBLabel.isEmpty || teamALabel.isEmpty || teamALabel == teamBLabel) {
      setState(() {
        errorMessage =
            "Veuillez entrer les noms des deux équipes et assurez-vous qu'ils sont différents.";
      });
      return;
    }
    teams.add(Team(teamType: TeamType.teamA, label: teamALabel));
    teams.add(Team(teamType: TeamType.teamB, label: teamBLabel));
    Game newGame = Game(teams: teams);

    setState(() {
      errorMessage = "";
    });

    _navigateTo(context, ScoreScreen(game: newGame));
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle partie')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("equipe 1"),
              TeamNameField(controller: teamAController, suit: "♣"),
              const SizedBox(height: 25),
              Text("contre"),
              const SizedBox(height: 25),
              Text("equipe 2"),
              TeamNameField(controller: teamBController, suit: "♠"),

              const SizedBox(height: 25),
              MenuButton(text: "commencer", onPressed: _validateTeams),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ), //comme ngIf en Angular,
            ],
          ),
        ),
      ),
    );
  }
}
