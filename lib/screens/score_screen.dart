import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/widgets/modals/add_round_modal.dart';
import 'package:score_belote/widgets/buttons.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/widgets/rounds_title_section.dart';
import 'package:score_belote/widgets/topbar.dart';
import 'package:score_belote/widgets/total_score_section.dart';
import 'package:score_belote/widgets/rounds_listview.dart';
import 'package:score_belote/widgets/modals/victory_modal.dart';

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

    // print(game.toJson());
    // box
    // print(gameHistory.toJson());
  }

  void _checkVictory(Game game, int target) async {
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
        await showDialog<bool>(
          context: context,
          barrierColor: const Color(0x8D14080C),
          builder: (_) => VictoryModal(
            winningTeam: teamWinner.label,
            scoreA: game.totalScoreA,
            scoreB: game.totalScoreB,
            onNewGame: () {
              Navigator.pop(context);
              _navigateTo(context, NewGameScreen());
            },
            onBack: () {
              Navigator.pop(context);
            },
          ),
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
      appBar: AppTopBar(title: 'Score', showDot: false),
      body: Center(
        child: Column(
          children: [
            // En-tête : nom + total, séparés par VS
            TotalScoreSection(game: widget.game, targetScore: targetScore),
            RoundsTitleSection(game: widget.game),
            Expanded(child: RoundsListview(rounds: widget.game.rounds)),
            Row(
              spacing: 4,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: AppPrimaryButton(
                    label: !gameFinish
                        ? '+ Ajouter un score'
                        : '♠ Nouvelle partie',
                    onPressed: () => !gameFinish
                        ? _openScoreModal()
                        : _navigateTo(context, NewGameScreen()),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
