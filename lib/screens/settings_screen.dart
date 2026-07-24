import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/check_option.dart';
import 'package:score_belote/widgets/switch_option.dart';
import 'package:score_belote/widgets/topbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

_doSomething(String label) {
  print("reinitialiser ");
  print("checkbox ${label}");
}

class SettingsScreenState extends State<SettingsScreen> {
  late bool _allowSplit = false; //tout A mizara
  List<SplitScore> splitValuesAllowed = []; // liste ny fizarana
  late bool _allowNoTrumpRedoubled = false; //sans A surcontré rava
  late bool _allowClubsRedoubled = false; //trèfle surcontré rava
  late bool _allTrumpCapotDedansEndsGame = false; //tout A capot dedans maty?

  void _toggleSplitScore(SplitScore splitScore) {
    setState(() {
      if (splitValuesAllowed.contains(splitScore)) {
        splitValuesAllowed.remove(splitScore);
      } else {
        splitValuesAllowed.add(splitScore);
      }
      print(splitValuesAllowed.length);
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
              spacing: 10,
              children: [
                SizedBox(height: 30),
                Center(
                  child: _groupLabel(AppStrings.gameOptions.toUpperCase()),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowSplitScore,
                    value: _allowSplit,
                    onChanged: (v) => setState(() => _allowSplit = v),
                  ),
                ),
                if (_allowSplit) _selectScoreSplitGroupSection(),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowClubsRedoubleScore,
                    value: _allowClubsRedoubled,
                    onChanged: (v) => setState(() => _allowClubsRedoubled = v),
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allowNoTrumpRedoubleScore,
                    value: _allowNoTrumpRedoubled,
                    onChanged: (v) =>
                        setState(() => _allowNoTrumpRedoubled = v),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: _groupLabel(
                    AppStrings.endGameRoundsLabel.toUpperCase(),
                  ),
                ),
                _rowExpanded(
                  SwitchOption(
                    label: AppStrings.allTrumpCapotDedansEndGame,
                    value: _allTrumpCapotDedansEndsGame,
                    onChanged: (v) =>
                        setState(() => _allTrumpCapotDedansEndsGame = v),
                  ),
                ),
                SizedBox(height: 20),
                Center(child: _groupLabel(AppStrings.data.toUpperCase())),
                _rowExpanded(
                  _valueRow(
                    context,
                    AppStrings.deleteHistory,
                    AppStrings.reset,
                    valueColor: AppColors.red,
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

  Widget _valueRow(context, String label, String value, {Color? valueColor}) =>
      _rowContainer(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.bodyBold.copyWith(fontSize: 14)),
            GestureDetector(
              onTap: () {
                _doSomething(label);
              },
              child: Text(
                value,
                style: AppTextStyles.button.copyWith(
                  fontSize: 13,
                  color: valueColor ?? AppColors.wine,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _rowContainer(Widget child) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    decoration: BoxDecoration(
      color: AppColors.cream2,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: AppColors.brown.withValues(alpha: 0.15),
        width: 2,
      ),
    ),
    child: child,
  );

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
                  checked: splitValuesAllowed.contains(splitScore),
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
