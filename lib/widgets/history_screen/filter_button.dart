import 'package:flutter/material.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class FilterButton extends StatelessWidget {
  final bool hasActiveFilters;
  final VoidCallback onShowFilters;
  final int activeFilterCount;

  const FilterButton({
    super.key,
    required this.hasActiveFilters,
    required this.onShowFilters,
    required this.activeFilterCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        hasActiveFilters
            ? AppGhostButton(
                label: HistoryStrings.filter,
                onPressed: onShowFilters,
              )
            : AppPrimaryButton(
                label: HistoryStrings.filter,
                onPressed: onShowFilters,
              ),

        if (hasActiveFilters && activeFilterCount > 0)
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.wine,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$activeFilterCount',
                style: AppTextStyles.bodyBold.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
