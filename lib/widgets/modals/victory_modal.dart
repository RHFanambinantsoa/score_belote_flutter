import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class VictoryModal extends StatelessWidget {
  final String winningTeam;
  final int scoreA;
  final int scoreB;

  const VictoryModal({
    super.key,
    required this.winningTeam,
    required this.scoreA,
    required this.scoreB,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.brown, width: 3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [AppColors.gold, AppColors.goldDeep],
                    ),
                    border: Border.fromBorderSide(
                      BorderSide(color: AppColors.brown, width: 4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text('🏆', style: TextStyle(fontSize: 46)),
                ),

                const SizedBox(height: 10),

                Text(
                  AppStrings.victory,
                  style: AppTextStyles.appTitle.copyWith(fontSize: 26),
                ),

                Text(
                  '$winningTeam ${AppStrings.winGame}',
                  style: AppTextStyles.button.copyWith(
                    fontSize: 17,
                    color: AppColors.wine,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cream2,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.brown, width: 2),
                  ),
                  child: Text(
                    '$scoreA — $scoreB',
                    style: AppTextStyles.button.copyWith(fontSize: 15),
                  ),
                ),

                const SizedBox(height: 24),

                AppPrimaryButton(
                  label: '♠ Nouvelle partie',
                  onPressed: () => {
                    Navigator.of(context).pop(true),
                    Navigator.pushReplacementNamed(context, RouteNames.newGame),
                  },
                ),
              ],
            ),
          ),

          Positioned(
            top: 14,
            right: 14,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text(
                '✕',
                style: AppTextStyles.button.copyWith(
                  fontSize: 26,
                  color: AppColors.gold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
