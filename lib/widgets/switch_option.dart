import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class SwitchOption extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const SwitchOption({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
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
          Text(label, style: AppTextStyles.bodyBold.copyWith(fontSize: 13.5)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.wineDeep,
            activeTrackColor: AppColors.gold,
            inactiveThumbColor: AppColors.cream,
            inactiveTrackColor: AppColors.wineLight,
          ),
        ],
      ),
    );
  }
}
