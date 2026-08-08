import 'package:flutter/material.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/widgets/base/switch_option.dart';

class RedoubleSection extends StatelessWidget {
  final GameSettings settings;
  final VoidCallback onChanged;

  const RedoubleSection({
    super.key,
    required this.settings,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final option in settings.redoubleOptions)
          Row(
            children: [
              Expanded(
                child: SwitchOption(
                  label: option.label,
                  value: option.enabled,
                  onChanged: (value) {
                    SettingsService.update((settings) {
                      settings.setRedouble(option.type, value);
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
