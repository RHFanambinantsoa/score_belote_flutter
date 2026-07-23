import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/constants/app_strings.dart';

class TeamNameField extends StatelessWidget {
  final TextEditingController controller;
  final String suit;
  final String hint;

  const TeamNameField({
    super.key,
    required this.controller,
    required this.suit,
    this.hint = AppStrings.teamInputHint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.brown, width: 2.5),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.wine,
              shape: BoxShape.circle,
            ),
            child: Text(
              suit,
              style: const TextStyle(color: AppColors.cream, fontSize: 14),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTextStyles.bodyBold,
              cursorColor: AppColors.wine,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.body.copyWith(
                  color: AppColors.wine.withValues(alpha: 0.4),
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
