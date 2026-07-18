import 'package:flutter/material.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/team.dart';

class AddRoundModal extends StatefulWidget {
  final Game game;
  const AddRoundModal({super.key, required this.game});

  @override
  State<AddRoundModal> createState() => _AddRoundModalState();
}

class _AddRoundModalState extends State<AddRoundModal> {
  late bool isCapot;
  late Team selectedTeam;
  late GameVariant selectedGameVariant;
  late RoundStatus selectedRoundStatus;

  Round roundTest = Round(
    gameVariant: GameVariant.clubs,
    roundStatus: RoundStatus.normal,
    isCapot: false,
    winnerTeam: Team(teamType: TeamType.teamA, label: "test"),
    score: GameVariant.clubs.baseScore,
  );

  @override
  void initState() {
    super.initState();
    isCapot = false;
    selectedTeam = widget.game.teams[0];
    selectedGameVariant = GameVariant.clubs;
    selectedRoundStatus = RoundStatus.normal;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _changeRadioButton(Team? teamSel) {
    if (teamSel != null) {
      setState(() {
        selectedTeam = teamSel;
      });
    }
  }

  void _emitRound() {
    print(selectedTeam.toJson());
    Round newRound = Round(
      gameVariant: selectedGameVariant,
      roundStatus: selectedRoundStatus,
      isCapot: false,
      winnerTeam: selectedTeam,
      score: 0,
    );
    Navigator.pop(context, newRound);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            Text("Ajouter un score", style: TextStyle(fontSize: 26)),
            Column(
              children: [
                Text("GAGNANT"),
                RadioMenuButton(
                  value: widget.game.teams[0],
                  groupValue: selectedTeam,
                  onChanged: (value) => _changeRadioButton(value),
                  child: Text(widget.game.teams[0].label),
                ),
                RadioMenuButton(
                  value: widget.game.teams[1],
                  groupValue: selectedTeam,
                  onChanged: (value) => _changeRadioButton(value),
                  child: Text(widget.game.teams[1].label),
                ),
                Text("Jeu"),

                Row(
                  children: [
                    Checkbox(
                      value: isCapot,
                      onChanged: (value) {
                        setState(() {
                          isCapot = value!;
                        });
                      },
                    ),
                    Text('Capot'),
                  ],
                ),
              ],
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Annuler"),
            ),

            ElevatedButton(
              onPressed: () {
                _emitRound();
              },
              child: const Text("Ajouter"),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Nouvelle Score')),
  //     body: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.all(24),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               children: [
  //                 Checkbox(
  //                   value: isCapot,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       isCapot = value!;
  //                     });
  //                   },
  //                 ),
  //                 Text('Capot'),
  //               ],
  //             ),

  //             TextField(
  //               controller: teamAController,
  //               decoration: const InputDecoration(labelText: "Nom équipe A"),
  //             ),
  //             const SizedBox(height: 25),
  //             Text("contre"),
  //             const SizedBox(height: 25),
  //             TextField(
  //               controller: teamBController,
  //               decoration: const InputDecoration(labelText: "Nom équipe B"),
  //             ),
  //             const SizedBox(height: 25),
  //             // MenuButton(text: "commencer", onPressed: _validateTeams),
  //             if (errorMessage.isNotEmpty)
  //               Text(
  //                 errorMessage,
  //                 style: const TextStyle(color: Colors.red),
  //               ), //comme ngIf en Angular,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
