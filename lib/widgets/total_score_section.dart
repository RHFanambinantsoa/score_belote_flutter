import 'package:flutter/widgets.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class TotalScoreSection extends StatelessWidget {
  final Game game;
  final int targetScore;
  const TotalScoreSection({
    super.key,
    required this.game,
    required this.targetScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.wine,
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 4)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        spacing: 10,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Objectif : ',
                  style: AppTextStyles.sectionLabel.copyWith(
                    fontSize: 18,
                    color: AppColors.cream2,
                  ),
                ),
                TextSpan(
                  text: "$targetScore",
                  style: AppTextStyles.sectionLabel.copyWith(
                    fontSize: 20,
                    color: AppColors.goldDeep,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            margin: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.brown.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _headerColumn(game.teams[0].label, game.totalScoreA),
              ),
              SizedBox(
                width: 34,
                child: Text(
                  'VS',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    color: AppColors.gold.withValues(alpha: 0.6),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: _headerColumn(game.teams[1].label, game.totalScoreB),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerColumn(String name, int total) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Text(
            name.toUpperCase(),
            style: AppTextStyles.button.copyWith(
              fontSize: 15,
              color: AppColors.cream.withValues(alpha: 0.85),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '$total',
          style: AppTextStyles.bigScore.copyWith(
            fontSize: 30,
            color: AppColors.gold,
          ),
        ),
      ],
    );
  }
}
