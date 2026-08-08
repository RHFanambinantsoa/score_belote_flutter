import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/widgets/base/check_option.dart';

class ScoreSplitSelector extends StatelessWidget {
  final GameSettings settings;
  final VoidCallback onChanged;

  const ScoreSplitSelector({
    super.key,
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                        _toggleSplitScore(splitScore);
                        onChanged();
                      },
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  void _toggleSplitScore(SplitScore splitScore) {
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
  }
}
