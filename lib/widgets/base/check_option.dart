import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Case à cocher façon "carte" — utilisée pour Capot, Dedans, Split
/// dans le modal de saisie du score. Contrairement à AppRadioOption,
/// plusieurs peuvent être cochées en même temps.
class AppCheckOption extends StatelessWidget {
  final String label;
  final bool checked;
  final ValueChanged<bool> onChanged;

  const AppCheckOption({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!checked),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.cream2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.brown.withValues(alpha: 0.15),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: checked ? AppColors.wine : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: checked ? AppColors.wine : AppColors.brown,
                  width: 2.5,
                ),
              ),
              child: checked
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: AppColors.cream,
                      weight: 900,
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.bodyBold.copyWith(fontSize: 13.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
