import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class AppSnackBar {
  static void show(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.brown,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles.button.copyWith(
            fontSize: 14,
            color: AppColors.cream,
          ),
        ),
      ),
    );
  }
}
