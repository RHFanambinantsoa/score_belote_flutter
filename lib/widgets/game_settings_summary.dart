import 'package:flutter/material.dart';
import 'package:score_belote/constants/settings_strings.dart';
import 'package:score_belote/models/game_settings.dart'; // adapte le chemin si GameSettings vit ailleurs
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class GameSettingsSummary extends StatelessWidget {
  final GameSettings settings;
  final VoidCallback? onEditSettings;
  final bool viewMode;

  const GameSettingsSummary({
    super.key,
    required this.settings,
    required this.viewMode,
    this.onEditSettings,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <_SummaryRow>[
      _SummaryRow(SettingsStrings.allowSplitScore, settings.allowSplit),
      for (final option in settings.redoubleOptions)
        _SummaryRow(option.label, option.enabled),
      for (final option in settings.capotVictoryOptions)
        _SummaryRow(option.label, option.enabled),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PARAMÈTRES DE LA PARTIE', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.cream2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.brown.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < rows.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: i < rows.length - 1
                        ? Border(
                            bottom: BorderSide(
                              color: AppColors.brown.withValues(alpha: 0.12),
                            ),
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          rows[i].label,
                          style: AppTextStyles.bodyBold.copyWith(fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _StatusMark(enabled: rows[i].enabled),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (!viewMode)
          AppGhostButton(
            label: 'Modifier les paramètres',
            onPressed: onEditSettings,
          ),
      ],
    );
  }
}

class _SummaryRow {
  final String label;
  final bool enabled;
  const _SummaryRow(this.label, this.enabled);
}

class _StatusMark extends StatelessWidget {
  final bool enabled;
  const _StatusMark({required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: enabled ? AppColors.green : AppColors.red,
      ),
      child: Icon(
        enabled ? Icons.check : Icons.close,
        size: 13,
        color: AppColors.cream,
      ),
    );
  }
}
