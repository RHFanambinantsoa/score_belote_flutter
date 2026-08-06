import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/widgets/modals/add_round_modal.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/widgets/score_screen/rounds_title_section.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/score_screen/total_score_section.dart';
import 'package:score_belote/widgets/score_screen/rounds_listview.dart';
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
  bool? startNewGameFromDialog = true;

  @override
  void initState() {
    //comme ng onInit dans angular, c'est appelé quand le widget est créé.
    super.initState();
  }

  int targetScore = ScoreConstants.targetScore;

  void _saveGameToHistory(Game game) {}

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
        game.finishGame(teamWinner.teamType);
        setState(() {
          gameFinish = true;
        });
        _saveGameToHistory(game);
        startNewGameFromDialog = await showDialog<bool>(
          context: context,
          barrierColor: const Color(0x8D14080C),
          builder: (_) => VictoryModal(
            winningTeam: teamWinner.label,
            scoreA: game.totalScoreA,
            scoreB: game.totalScoreB,
          ),
        );
        if (startNewGameFromDialog == false) {
          setState(() {
            startNewGameFromDialog = false;
          });
        }
      }
    }
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _addRoundsToGame(Round round) {
    setState(() {
      widget.game.rounds.add(round);
    });
    _checkVictory(widget.game, targetScore);
  }

  void _openScoreModal() async {
    final round = await showModalBottomSheet<Round>(
      context: context,
      builder: (context) {
        return AddRoundModal(game: widget.game);
      },
    );
    if (round != null) {
      _addRoundsToGame(round);
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
                if (!gameFinish)
                  Expanded(
                    child: AppPrimaryButton(
                      label: '+ Ajouter un score',
                      onPressed: () => _openScoreModal(),
                    ),
                  ),
                if (gameFinish && !startNewGameFromDialog!)
                  Expanded(
                    child: AppPrimaryButton(
                      label: '♠ Nouvelle partie',
                      onPressed: () => _navigateTo(context, NewGameScreen()),
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
