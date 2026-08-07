import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/models/team_score.dart';
import 'package:score_belote/services/round_name_parser.dart';
import 'package:score_belote/services/score_calculator.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/add_round/action_buttons_section.dart';
import 'package:score_belote/widgets/add_round/capot_selector.dart';
import 'package:score_belote/widgets/add_round/round_resume_section.dart';
import 'package:score_belote/widgets/add_round/split_option.dart';
import 'package:score_belote/widgets/add_round/split_selector.dart';
import 'package:score_belote/widgets/add_round/game_variant_selector.dart';
import 'package:score_belote/widgets/add_round/team_selector.dart';
import 'package:score_belote/widgets/add_round/round_status_selector.dart';

class AddRoundModal extends StatefulWidget {
  final Game game;
  const AddRoundModal({super.key, required this.game});

  @override
  State<AddRoundModal> createState() => _AddRoundModalState();
}

class _AddRoundModalState extends State<AddRoundModal> {
  late ScoreParameters params;

  @override
  void initState() {
    super.initState();
    params = ScoreParameters(
      gameVariant: GameVariant.clubs,
      roundStatus: RoundStatus.normal,
      isSplit: false,
      isCapot: false,
      isDedans: false,
      winner: TeamType.teamA,
      splitValue: widget.game.settings.orderedAllowedSplits.isNotEmpty
          ? widget.game.settings.orderedAllowedSplits[0]
          : null,
    );
  }

  void _onSubmit() {
    Round round = Round.create(
      gameVariant: params.isSplit ? GameVariant.allTrump : params.gameVariant,
      roundStatus: params.roundStatus,
      isCapot: params.isCapot,
      isDedans: params.isDedans,
      teamAScore: calculateScores(params).teamA,
      teamBScore: calculateScores(params).teamB,
    );
    Navigator.pop(context, round);
  }

  bool _hideRedouble() =>
      (params.gameVariant == GameVariant.clubs &&
          widget.game.settings.allowClubsRedouble == false) ||
      (params.gameVariant == GameVariant.noTrump &&
          widget.game.settings.allowNoTrumpRedouble == false);

  bool _displayDedans() =>
      params.isCapot &&
      ((params.gameVariant == GameVariant.allTrump &&
              widget.game.settings.allTrumpCapotDedansEndGame) ||
          params.gameVariant == GameVariant.noTrump);

  void _resetAllFields() {
    params.isCapot = false;
    params.isDedans = false;
    params.roundStatus = RoundStatus.normal;
    params.splitValue = params.isSplit
        ? widget.game.settings.orderedAllowedSplits.isNotEmpty
              ? widget.game.settings.orderedAllowedSplits[0]
              : null
        : null;
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
                    isSplit: params.isSplit,
                    display: widget.game.settings.allowSplit,
                    onChanged: (v) {
                      setState(() {
                        params.isSplit = v;
                        _resetAllFields();
                      });
                    },
                  ),
                  TeamSelector(
                    teams: widget.game.teams,
                    selectedTeam: params.winner,
                    isSplit: params.isSplit,
                    onSelected: (team) {
                      setState(() {
                        params.winner = team;
                      });
                    },
                  ),

                  if (!params.isSplit)
                    Column(
                      spacing: 12,
                      children: [
                        GameVariantSelector(
                          selected: params.gameVariant,
                          onSelected: (v) {
                            setState(() {
                              params.gameVariant = v;
                              _resetAllFields();
                            });
                          },
                        ),
                        CapotSelector(
                          displayDedans: _displayDedans(),
                          onDedansChanged: (v) =>
                              setState(() => params.isDedans = v),
                          isCapot: params.isCapot,
                          isDedans: params.isDedans,
                          onCapotChanged: (v) =>
                              setState(() => params.isCapot = v),
                        ),
                        RoundStatusSelector(
                          selected: params.roundStatus,
                          hideRedouble: _hideRedouble(),
                          onChanged: (status) {
                            setState(() {
                              params.roundStatus = status;
                            });
                          },
                        ),
                      ],
                    ),

                  if (params.isSplit && params.splitValue != null)
                    SplitSelector(
                      splits: widget.game.settings.orderedAllowedSplits,
                      selected: params.splitValue!,
                      onChanged: (split) {
                        setState(() {
                          params.splitValue = split;
                        });
                      },
                    ),
                ],
              ),
              RoundResumeSection(
                roundNameResume: longRoundNameResume(
                  params.gameVariant,
                  params.roundStatus,
                ),
                isSplit: params.isSplit,
                capotStatus: capotStatus(params.isCapot, params.isDedans),
                teams: widget.game.teams,
                teamAScore: calculateScores(params).teamA,
                teamBScore: calculateScores(params).teamB,
              ),
              ActionButtonsSection(
                onCancelPressed: () => Navigator.of(context).pop(),
                onSubmitPressed: () {
                  _onSubmit();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
