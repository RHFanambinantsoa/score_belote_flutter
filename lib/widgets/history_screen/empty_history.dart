import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(AppStrings.cardEmoji, style: TextStyle(fontSize: 36)),
            const SizedBox(height: 10),
            Text(
              HistoryStrings.emptyHistoryMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyBold.copyWith(
                color: AppColors.wine.withValues(alpha: 0.7),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
