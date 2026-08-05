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
import 'package:score_belote/widgets/buttons.dart';
import 'package:score_belote/widgets/check_option.dart';
import 'package:score_belote/widgets/game_variant_selector.dart';
import 'package:score_belote/widgets/radio_option.dart';
import 'package:score_belote/widgets/switch_option.dart';

class AddRoundModal extends StatefulWidget {
  final Game game;
  const AddRoundModal({super.key, required this.game});

  @override
  State<AddRoundModal> createState() => _AddRoundModalState();
}

class _AddRoundModalState extends State<AddRoundModal> {
  late bool _isCapot = false;
  late bool _isSplit = false;
  late bool isDefending = false;
  TeamType _selectedTeam = TeamType.teamA;
  GameVariant _selectedGameVariant = GameVariant.clubs;
  RoundStatus _selectedRoundStatus = RoundStatus.normal;
  SplitScore _selectedSplitScore = ScoreConstants.splitAllTrumpScores[0];
  bool _hideRedouble = false;

  void _emitRound() {
    Round round;
    round = Round.create(
      gameVariant: _selectedGameVariant,
      roundStatus: _selectedRoundStatus,
      isCapot: _isCapot,
      isDedans: isDefending,
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

  bool _hideRedoubleRoundStatusOptions() {
    return (_selectedGameVariant == GameVariant.clubs &&
            widget.game.settings.allowClubsRedouble == false) ||
        (_selectedGameVariant == GameVariant.noTrump &&
            widget.game.settings.allowNoTrumpRedouble == false);
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
                  Row(
                    children: [
                      if (widget.game.settings.allowSplit == true)
                        Expanded(
                          child: SwitchOption(
                            label: AppStrings.splitScoreMode,
                            value: _isSplit,
                            onChanged: (v) => setState(() => _isSplit = v),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    spacing: 4,
                    children: [
                      if (_isSplit)
                        _groupLabel(
                          "${AppStrings.game} : ${AppStrings.allTrump}",
                        ),
                      _groupLabel(
                        _isSplit ? AppStrings.caller : AppStrings.winner,
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          ...widget.game.teams.map(
                            (team) => Expanded(
                              child: _teamButton(team.label, team.teamType),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  if (!_isSplit)
                    Column(
                      spacing: 12,
                      children: [
                        Column(
                          spacing: 4,
                          children: [
                            _groupLabel(AppStrings.game),
                            GameVariantSelector(
                              selected: _selectedGameVariant,
                              onSelected: (v) {
                                setState(() {
                                  _selectedGameVariant = v;
                                  _hideRedouble =
                                      _hideRedoubleRoundStatusOptions();
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: AppCheckOption(
                                label: AppStrings.capot,
                                checked: _isCapot,
                                onChanged: (v) => setState(() => _isCapot = v),
                              ),
                            ),
                            if (_isCapot &&
                                (_selectedGameVariant == GameVariant.allTrump ||
                                    _selectedGameVariant ==
                                        GameVariant.noTrump))
                              Expanded(
                                child: AppCheckOption(
                                  label: AppStrings.dedans,
                                  checked: isDefending,
                                  onChanged: (v) =>
                                      setState(() => isDefending = v),
                                ),
                              ),
                          ],
                        ),

                        Column(
                          spacing: 4,
                          children: [
                            _groupLabel(AppStrings.mode),
                            Column(
                              spacing: 4,
                              children: [
                                ...(_hideRedouble
                                        ? RoundStatus.withoutRedoubled
                                        : RoundStatus.values)
                                    .map(
                                      (roundStatus) => AppRadioOption(
                                        value: roundStatus,
                                        groupValue: _selectedRoundStatus,
                                        label: roundStatus.label,
                                        onChanged: (v) => setState(
                                          () => _selectedRoundStatus = v,
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (_isSplit)
                    Column(
                      children: [
                        _groupLabel(AppStrings.splitValues),
                        ...widget.game.settings.orderedAllowedSplits.map(
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
              const SizedBox(height: 16),
              _resumeNewScoreToAdd(),
              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(
                      label: AppStrings.cancel,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppPrimaryButton(
                      label: AppStrings.submit,
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

  Widget _teamButton(String label, TeamType value) {
    final active = _selectedTeam == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedTeam = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.gold : AppColors.cream2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.brown, width: 2.5),
          boxShadow: active
              ? const [
                  BoxShadow(color: AppColors.goldDeep, offset: Offset(0, 4)),
                ]
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(
            label,
            style: AppTextStyles.button.copyWith(
              fontSize: 15,
              color: AppColors.wineDeep,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

Widget _groupLabel(String text) => Padding(
  padding: const EdgeInsets.all(4),
  child: Center(
    child: Text(
      text,
      style: AppTextStyles.sectionLabel.copyWith(fontWeight: FontWeight.w700),
    ),
  ),
);
