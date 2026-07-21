import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Ligne d'option façon "radio" — rond qui se remplit en bordeaux
/// quand sélectionné. Utilisé pour l'annonce (Normale / Contré / ...).
class AppRadioOption<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final ValueChanged<T> onChanged;

  const AppRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final checked = value == groupValue;
    return GestureDetector(
      //tsy haiko ty hoe manao inona, mbola mila jerene rehefa misy connex
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.cream2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.brown.withOpacity(0.15),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: checked ? AppColors.wine : AppColors.brown,
                  width: 2.5,
                ),
              ),
              child: checked
                  ? Padding(
                      padding: const EdgeInsets.all(3),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.wine,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Text(label, style: AppTextStyles.bodyBold.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
