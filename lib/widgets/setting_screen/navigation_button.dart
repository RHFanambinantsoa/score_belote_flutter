import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NavigationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              // margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              // padding: const EdgeInsets.all(30),
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
                  Text(
                    AppStrings.gameRules,
                    style: AppTextStyles.bodyBold.copyWith(fontSize: 14),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.wine, size: 18),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
