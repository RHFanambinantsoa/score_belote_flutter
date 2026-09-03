import 'package:flutter/material.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/constants/settings_strings.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/widgets/add_round/group_label.dart';
import 'package:score_belote/widgets/base/switch_option.dart';

class CapotVictorySection extends StatelessWidget {
  final GameSettings settings;
  final VoidCallback onChanged;

  const CapotVictorySection({
    super.key,
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Center(
          child: GroupLabel(label: HistoryStrings.capotVictory.toUpperCase()),
        ),

        for (final option in settings.capotVictoryOptions)
          Row(
            children: [
              Expanded(
                child: SwitchOption(
                  label: option.label,
                  value: option.enabled,
                  onChanged: (value) {
                    SettingsService.update((settings) {
                      settings.setCapotVictory(option.type, value);
                    });
                    onChanged();
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}
