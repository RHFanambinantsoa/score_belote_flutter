import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/screens/rule_screen.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/check_option.dart';
import 'package:score_belote/widgets/switch_option.dart';
import 'package:score_belote/widgets/topbar.dart';
import 'package:score_belote/widgets/delete_history_button.dart';

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
                          settings.allowSplit = v;
                          if (v == false) {
                            settings.allowedSplits.clear();
                          } else {
                            settings.allowedSplits.addAll(
                              ScoreConstants.communSplitAllTrumpScores,
                            );
                          }
                        });
                      });
                    },
                  ),
                ),
                if (settings.allowSplit) _selectScoreSplitGroupSection(),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowClubsRedoubleScore,
                    value: settings.allowClubsRedouble,
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.allowClubsRedouble = v;
                        });
                      });
                    },
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowNoTrumpRedoubleScore,
                    value: settings.allowNoTrumpRedouble,
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.allowNoTrumpRedouble = v;
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
                    label: AppStrings.allTrumpCapotDedansEndGame,
                    value: settings.allTrumpCapotDedansEndGame,
                    onChanged: (v) {
                      setState(() {
                        SettingsService.update((settings) {
                          settings.allTrumpCapotDedansEndGame = v;
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
                _rowExpanded(
                  _navigationButton(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RuleScreen()),
                    );
                  }),
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

  Widget _navigationButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        // margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        // padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.cream2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.brown.withValues(alpha: 0.15),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.gameRules,
              style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
            ),
            Icon(Icons.chevron_right, color: AppColors.wine, size: 18),
          ],
        ),
      ),
    );
  }

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
