import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/option_types.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/screens/rule_screen.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/check_option.dart';
import 'package:score_belote/widgets/base/switch_option.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/setting_screen/navigation_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

void _doSomething() {
  // print("reinitialiser ");
}

class SettingsScreenState extends State<SettingsScreen> {
  late GameSettings settings;

  @override
  void initState() {
    super.initState();
    settings = SettingsService.settings;
  }

  void _toggleSplitScore(SplitScore splitScore) {
    setState(() {
      SettingsService.update((settings) {
        if (settings.allowedSplits.contains(splitScore)) {
          settings.allowedSplits.remove(splitScore);
        } else {
          settings.allowedSplits.add(splitScore);
        }
        if (settings.allowedSplits.isEmpty) {
          settings.allowSplit = false;
        }
      });

      //
      // print(allowedSplits.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'Paramètres'),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              children: [
                SizedBox(height: 20),
                Center(
                  child: _groupLabel(AppStrings.gameOptions.toUpperCase()),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowSplitScore,
                    value: settings.allowSplit,
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          if (v == false) {
                            settings.allowedSplits.clear();
                          } else {
                            settings.allowedSplits.addAll(
                              ScoreConstants.communSplitAllTrumpScores,
                            );
                          }
                          settings.allowSplit = v;
                        });
                      });
                    },
                  ),
                ),
                if (settings.allowSplit) _selectScoreSplitGroupSection(),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowClubsRedoubleScore,
                    value: settings.isRedoubleAllowed(RedoubleType.clubs),
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.setRedouble(RedoubleType.clubs, v);
                        });
                      });
                    },
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowNoTrumpRedoubleScore,
                    value: settings.isRedoubleAllowed(RedoubleType.noTrump),
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.setRedouble(RedoubleType.noTrump, v);
                        });
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: _groupLabel(
                    AppStrings.endGameRoundsLabel.toUpperCase(),
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.suitsCapotVictory,
                    value: settings.isCapotVictoryAllowed(
                      CapotVictoryType.suits,
                    ),
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.setCapotVictory(CapotVictoryType.suits, v);
                        });
                      });
                    },
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allTrumpCapotDedansVictory,
                    value: settings.isCapotVictoryAllowed(
                      CapotVictoryType.allTrumpDedans,
                    ),
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.setCapotVictory(
                            CapotVictoryType.allTrumpDedans,
                            v,
                          );
                        });
                      });
                    },
                  ),
                ),

                SizedBox(height: 15),
                Center(child: _groupLabel(AppStrings.data.toUpperCase())),
                _rowExpanded(AppDeleteHistoryButton(onPressed: _doSomething)),
                SizedBox(height: 15),
                Center(child: _groupLabel("INFO")),

                NavigationButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RuleScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget _rowExpanded(Widget child) => Row(children: [Expanded(child: child)]);

  Widget _selectScoreSplitGroupSection() {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Center(
            child: Container(
              width: 2,
              height: 300,
              color: AppColors.brown.withValues(alpha: 0.15),
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 8,
            children: [
              ...ScoreConstants.splitAllTrumpScores.map(
                (splitScore) => AppCheckOption(
                  label:
                      " ${splitScore.defenderScore}  -  ${splitScore.callerScore} ",
                  checked: settings.allowedSplits.contains(splitScore),
                  onChanged: (_) {
                    // Le _ signifie simplement "je reçois ce paramètre mais je ne m'en sers pas".
                    _toggleSplitScore(splitScore);
                  },
                ),
              ),
              SizedBox(width: 30),
            ],
          ),
        ),
      ],
    );
  }
}
