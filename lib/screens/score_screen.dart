import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/widgets/add_round_modal.dart';
import 'package:score_belote/widgets/buttons.dart';

import 'package:score_belote/screens/new_game_screen.dart';

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
  bool gameFinish = false;

  @override
  void initState() {
    //comme ng onInit dans angular, c'est appelé quand le widget est créé.
    super.initState();
  }

  int targetScore = ScoreConstants.targetScore;

  void _saveGameToHistory(Game game) {
    // String dateHeure = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

    print(game.toJson());
    // box
    // print(gameHistory.toJson());
  }

  void _checkVictory(Game game, int target) {
    if (game.totalScoreA >= target && game.totalScoreB >= target) {
      setState(() {
        targetScore = target + ScoreConstants.targetIncrementInterval;
      });
      showAboutDialog(
        context: context,
        children: [Text("samy tonga $target fa maty $targetScore indray")],
      );
    } else {
      if (game.totalScoreA >= target || game.totalScoreB >= target) {
        Team teamWinner = game.totalScoreA > game.totalScoreB
            ? game.teams[0]
            : game.teams[1];
        game.winner = teamWinner.teamType;
        setState(() {
          gameFinish = true;
        });
        _saveGameToHistory(game);
        showAboutDialog(
          context: context,
          children: [
            Text("naharesy ${teamWinner.label} o"),
            Text(" scores ${game.totalScoreA} - ${game.totalScoreB}"),
          ],
        );
      }
    }
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _addRoundsToGame(List<Round> rounds) {
    setState(() {
      for (var i = 0; i < rounds.length; i++) {
        widget.game.rounds.add(rounds[i]);
      }
    });
    _checkVictory(widget.game, targetScore);
  }

  void _openScoreModal() async {
    final rounds = await showModalBottomSheet<List<Round>>(
      context: context,
      builder: (context) {
        return AddRoundModal(game: widget.game);
      },
    );
    if (rounds != null && rounds.isNotEmpty) {
      _addRoundsToGame(rounds);
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
            Text("target: $targetScore"),
            Text("${widget.game.totalScoreA} vs ${widget.game.totalScoreB}"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    ...widget.game.teamARounds.map(
                      (round) => Text(" ${round.score}"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ...widget.game.teamBRounds
                    // ... est un spread operator
                    .map((round) => Text(" ${round.score} ")),
                  ],
                ),
              ],
            ),
            if (!gameFinish)
              AppPrimaryButton(
                label: '+ Ajouter un score',
                onPressed: () => _openScoreModal(),
              ),
            if (gameFinish)
              AppPrimaryButton(
                label: '♠ Nouvelle partie',
                onPressed: () => _navigateTo(context, const NewGameScreen()),
              ),
          ],
        ),
      ),
    );
  }
}
