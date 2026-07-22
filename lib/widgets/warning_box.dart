import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class WarningBox extends StatelessWidget {
  const WarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //equivalent à css width:100%;
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.goldDeep, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.warningEmoji, style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyBold.copyWith(
                  fontSize: 12,
                  height: 1.5,
                  color: AppColors.wineDeep,
                ),
                children: const [
                  TextSpan(
                    text: 'Les règles utilisées ici sont celles de la belote ',
                  ),
                  TextSpan(
                    text: '"Gasy"',
                    style: TextStyle(color: AppColors.wine),
                  ),
                  TextSpan(
                    text: ', qui peuvent différer de la belote classique.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
