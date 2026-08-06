import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/services/score_calculator.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/add_round/action_buttons_section.dart';
import 'package:score_belote/widgets/add_round/capot_selector.dart';
import 'package:score_belote/widgets/add_round/round_resume_section.dart';
import 'package:score_belote/widgets/add_round/split_option.dart';
import 'package:score_belote/widgets/add_round/split_selector.dart';
import 'package:score_belote/widgets/game_variant_selector.dart';
import 'package:score_belote/widgets/add_round/team_selector.dart';
import 'package:score_belote/widgets/add_round/round_status_selector.dart';

class AddRoundModal extends StatefulWidget {
  final Game game;
  const AddRoundModal({super.key, required this.game});

  @override
  State<AddRoundModal> createState() => _AddRoundModalState();
}

class _AddRoundModalState extends State<AddRoundModal> {
  late bool _isCapot = false;
  late bool _isSplit = false;
  late bool _isDedans = false;
  TeamType _selectedTeam = TeamType.teamA;
  GameVariant _selectedGameVariant = GameVariant.clubs;
  RoundStatus _selectedRoundStatus = RoundStatus.normal;
  SplitScore _selectedSplitScore = ScoreConstants.splitAllTrumpScores[0];

  void _emitRound() {
    Round round;
    round = Round.create(
      gameVariant: _selectedGameVariant,
      roundStatus: _selectedRoundStatus,
      isCapot: _isCapot,
      isDedans: _isDedans,
      teamAScore: 0,
      teamBScore: 0,
    );
    round = calculateRoundScoresToAdd(
      round,
      _selectedTeam,
      _isSplit,
      _selectedSplitScore,
    );
    Navigator.pop(context, round);
  }

  bool _hideRedouble() =>
      (_selectedGameVariant == GameVariant.clubs &&
          widget.game.settings.allowClubsRedouble == false) ||
      (_selectedGameVariant == GameVariant.noTrump &&
          widget.game.settings.allowNoTrumpRedouble == false);

  bool _displayDedans() =>
      _isCapot &&
      ((_selectedGameVariant == GameVariant.allTrump &&
              widget.game.settings.allTrumpCapotDedansEndGame) ||
          _selectedGameVariant == GameVariant.noTrump);

  void _resetAllFields() {
    setState(() {
      _isCapot = false;
      _isDedans = false;
      _selectedRoundStatus = RoundStatus.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 14,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.newScore,
                textAlign: TextAlign.center,
                style: AppTextStyles.modalTitle,
              ),
              Column(
                spacing: 12,
                children: [
                  SplitOption(
                    isSplit: _isSplit,
                    display: widget.game.settings.allowSplit,
                    onChanged: (v) {
                      setState(() {
                        _isSplit = v;
                        _resetAllFields();
                      });
                    },
                  ),
                  TeamSelector(
                    teams: widget.game.teams,
                    selectedTeam: _selectedTeam,
                    isSplit: _isSplit,
                    onSelected: (team) {
                      setState(() {
                        _selectedTeam = team;
                      });
                    },
                  ),

                  if (!_isSplit)
                    Column(
                      spacing: 12,
                      children: [
                        GameVariantSelector(
                          selected: _selectedGameVariant,
                          onSelected: (v) {
                            setState(() {
                              _selectedGameVariant = v;
                              _resetAllFields();
                            });
                          },
                        ),
                        CapotSelector(
                          displayDedans: _displayDedans(),
                          onDedansChanged: (v) => setState(() => _isDedans = v),
                          isCapot: _isCapot,
                          isDedans: _isDedans,
                          onCapotChanged: (v) => setState(() => _isCapot = v),
                        ),
                        RoundStatusSelector(
                          selected: _selectedRoundStatus,
                          hideRedouble: _hideRedouble(),
                          onChanged: (status) {
                            setState(() {
                              _selectedRoundStatus = status;
                            });
                          },
                        ),
                      ],
                    ),

                  if (_isSplit)
                    SplitSelector(
                      splits: widget.game.settings.orderedAllowedSplits,
                      selected: _selectedSplitScore,
                      onChanged: (split) {
                        setState(() {
                          _selectedSplitScore = split;
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 16),
              RoundResumeSection(
                roundNameResume: _selectedGameVariant.label,
                isSplit: _isSplit,
                roundStatusName: _selectedRoundStatus.label,
                teams: widget.game.teams,
                teamAScore: 104,
                teamBScore: 0,
              ),
              _resumeNewScoreToAdd(),
              ActionButtonsSection(
                onCancelPressed: () => Navigator.of(context).pop(),
                onSubmitPressed: () {
                  _emitRound();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //logique à faire
  Widget _resumeNewScoreToAdd() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          spacing: 4,
          children: [
            Text(
              "ToutA Contré Capot",
              style: AppTextStyles.sectionLabel.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.brown,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: ' Pour  ',
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 18,
                      color: AppColors.brown,
                    ),
                  ),
                  TextSpan(
                    text: "Nous",
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 20,
                      color: AppColors.goldDeep,
                    ),
                  ),
                  TextSpan(
                    text: ' ? ',
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 18,
                      color: AppColors.brown,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "+ 104",
                    style: AppTextStyles.bigScore.copyWith(
                      fontSize: 28,
                      color: AppColors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
