import 'package:flutter/material.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/widgets/add_round_modal.dart';
import 'package:score_belote/widgets/menu_button.dart';

class ScoreScreen extends StatefulWidget {
  final Game game;
  //comme dans @input dans angular à peu près, on peut passer un objet game à ce widget ScoreScreen, et on pourra l'utiliser dans le widget.
  const ScoreScreen({super.key, required this.game});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  //misy class 2 rehefa stafulwidget,
  //il y a une classe pour le widget et une classe pour l'état du widget.
  // dans la classe _ScoreScreenState, on peut accéder à widget.game pour récupérer l'objet game passé en paramètre au widget ScoreScreen.

  final _roundTestA = Round(
    gameVariant: GameVariant.clubs,
    roundStatus: RoundStatus.normal,
    isCapot: false,
    winnerTeam: Team(teamType: TeamType.teamA, label: "test"),
    score: GameVariant.clubs.baseScore,
  );
  final _roundTestB = Round(
    gameVariant: GameVariant.spades,
    roundStatus: RoundStatus.normal,
    isCapot: false,
    winnerTeam: Team(teamType: TeamType.teamB, label: "testB"),
    score: GameVariant.spades.baseScore,
  );

  @override
  void initState() {
    //comme ng onInit dans angular, c'est appelé quand le widget est créé.
    super.initState();
  }

  void _addRoundToGame(Round round, TeamType team) {
    widget.game.rounds.add(round);
    setState(() {});
  }

  void _openScoreModal() async {
    final round = await showModalBottomSheet<Round>(
      context: context,
      builder: (context) {
        return AddRoundModal(game: widget.game);
      },
    );
    if (round != null) {
      _addRoundToGame(round, round.winnerTeam.teamType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score de la partie')),
      body: Center(
        child: Column(
          children: [
            Text(
              "${widget.game.teams[0].label} vs ${widget.game.teams[1].label}",
              style: TextStyle(fontSize: 20),
            ),
            Text("${widget.game.totalScoreA} vs ${widget.game.totalScoreB}"),
            Row(
              children: [
                Column(
                  children: [
                    ...widget.game.teamARounds.map(
                      (round) =>
                          Text("${round.gameVariant}: ${round.score} points"),
                    ),
                    MenuButton(
                      text: " add for A",
                      onPressed: () =>
                          _addRoundToGame(_roundTestA, TeamType.teamA),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ...widget.game.teamBRounds
                    // ... est un spread operator
                    .map(
                      (round) =>
                          Text("${round.gameVariant}: ${round.score} points"),
                    ),
                    MenuButton(
                      text: " add for B",
                      onPressed: () =>
                          _addRoundToGame(_roundTestB, TeamType.teamB),
                    ),
                  ],
                ),
              ],
            ),
            MenuButton(text: "modal", onPressed: () => _openScoreModal()),
          ],
        ),
      ),
    );
  }
}
