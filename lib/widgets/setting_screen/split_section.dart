import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/widgets/base/switch_option.dart';

class SplitSection extends StatelessWidget {
  final GameSettings settings;
  final VoidCallback onChanged;

  const SplitSection({
    super.key,
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SwitchOption(
            label: AppStrings.allowSplitScore,
            value: settings.allowSplit,
            onChanged: (v) {
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
              onChanged();
            },
          ),
        ),
      ],
    );
  }
}
