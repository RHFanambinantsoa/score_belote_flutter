import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/services/score_calculator.dart';
import 'package:score_belote/widgets/buttons.dart';
import 'package:score_belote/widgets/game_variant_selector.dart';
import 'package:score_belote/widgets/radio_option.dart';

class AddRoundModal extends StatefulWidget {
  final Game game;
  const AddRoundModal({super.key, required this.game});

  @override
  State<AddRoundModal> createState() => _AddRoundModalState();
}

class _AddRoundModalState extends State<AddRoundModal> {
  late bool isCapot = false;
  late bool isSplit = false;
  late bool isDefending = false;
  TeamType selectedTeam = TeamType.teamA;
  GameVariant _selectedGameVariant = GameVariant.clubs;
  RoundStatus _selectedRoundStatus = RoundStatus.normal;
  SplitScore _selectedSplitScore = ScoreConstants.splitAllTrumpScores[0];

  void _selectTeam(TeamType? value) {
    if (value != null) {
      setState(() {
        selectedTeam = value;
      });
    }
  }

  void _emitRound() {
    List<Round> rounds = [];
    if (!isSplit) {
      Round newRound = Round(
        gameVariant: _selectedGameVariant,
        roundStatus: _selectedRoundStatus,
        isCapot: isCapot,
        isDefending: isDefending,
        winnerTeam: selectedTeam,
        score: 0,
      );
      newRound.score = calculateNormalScoreToAdd(newRound);
      rounds.add(newRound);
    } else {
      Round callerRound = Round(
        gameVariant: GameVariant.allTrump,
        roundStatus: RoundStatus.normal,
        isCapot: false,
        isDefending: false,
        winnerTeam: selectedTeam,
        score: _selectedSplitScore.callerScore,
      );
      rounds.add(callerRound);
      final defenderTeam = widget.game.teams.firstWhere(
        (team) => team.teamType != selectedTeam,
      );
      Round defenderRound = Round(
        gameVariant: GameVariant.allTrump,
        roundStatus: RoundStatus.normal,
        isCapot: false,
        isDefending: false,
        winnerTeam: defenderTeam.teamType,
        score: _selectedSplitScore.defenderScore,
      );
      rounds.add(defenderRound);
    }
    Navigator.pop(context, rounds);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Ajouter un score", style: TextStyle(fontSize: 26)),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isSplit,
                        onChanged: (value) {
                          setState(() {
                            isSplit = value!;
                          });
                        },
                      ),
                      Text('Split'),
                    ],
                  ),
                  if (!isSplit) Text("GAGNANT"),
                  if (isSplit) Text("Iza no niantso?"),
                  Row(
                    children: [
                      ...widget.game.teams.map(
                        (team) => RadioMenuButton(
                          value: team.teamType,
                          groupValue: selectedTeam,
                          onChanged: (value) => _selectTeam(value),
                          child: Text(team.label),
                        ),
                      ),
                    ],
                  ),

                  if (!isSplit)
                    Column(
                      children: [
                        Text(
                          "${selectedTeam == TeamType.teamA ? widget.game.totalScoreA : widget.game.totalScoreB}",
                        ),
                        Text("Jeu"),
                        GameVariantSelector(
                          selected: _selectedGameVariant,
                          onSelected: (v) =>
                              setState(() => _selectedGameVariant = v),
                        ),

                        Text("Mode"),
                        ...RoundStatus.values.map(
                          (roundStatus) => AppRadioOption(
                            value: roundStatus,
                            groupValue: _selectedRoundStatus,
                            label: roundStatus.label,
                            onChanged: (v) =>
                                setState(() => _selectedRoundStatus = v),
                          ),
                        ),
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
                        if (isCapot &&
                            (_selectedGameVariant == GameVariant.allTrump ||
                                _selectedGameVariant == GameVariant.noTrump))
                          Row(
                            children: [
                              Checkbox(
                                value: isDefending,
                                onChanged: (value) {
                                  setState(() {
                                    isDefending = value!;
                                  });
                                },
                              ),
                              Text('Dedans'),
                            ],
                          ),
                      ],
                    ),
                  if (isSplit)
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 20,
                          children: [
                            Text("${widget.game.totalScoreA}"),
                            Text("${widget.game.totalScoreB}"),
                          ],
                        ),
                        Text("Tout Atout"),
                        ...ScoreConstants.splitAllTrumpScores.map(
                          (splitScore) => AppRadioOption(
                            value: splitScore,
                            groupValue: _selectedSplitScore,
                            label:
                                " ${splitScore.defenderScore}  -  ${splitScore.callerScore} ",
                            onChanged: (v) =>
                                setState(() => _selectedSplitScore = v),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(
                      label: 'Annuler',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppPrimaryButton(
                      label: 'Valider',
                      onPressed: () {
                        _emitRound();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
