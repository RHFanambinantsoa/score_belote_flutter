import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class HistoryCard extends StatelessWidget {
  final Game game;

  const HistoryCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.brown.withValues(alpha: 0.15),
          width: 2,
        ),
      ),
      child: Column(
        spacing: 6,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                game.createdTime,
                style: AppTextStyles.bodyBold.copyWith(
                  fontSize: 11,
                  color: AppColors.wine,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: _side(game.teamA, game.totalScoreA, game.winner)),
              const Text(
                AppStrings.versusEmoji,
                style: TextStyle(color: AppColors.wine, fontSize: 20),
              ),
              Expanded(child: _side(game.teamB, game.totalScoreB, game.winner)),
            ],
          ),
          _aboutSection(game.endGameInfo),
        ],
      ),
    );
  }
}

Widget _side(Team team, int score, TeamType? winner) {
  return Column(
    children: [
      Text(
        (winner != null && winner == team.teamType
                ? '${AppStrings.trophyEmoji} '
                : '') +
            team.label.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppTextStyles.sectionLabel.copyWith(fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '$score',
        style: AppTextStyles.bigScore.copyWith(
          fontSize: 24,
          color: winner != null && winner == team.teamType
              ? AppColors.goldDeep
              : AppColors.wineDeep,
        ),
      ),
    ],
  );
}

Widget _aboutSection(String info) {
  return Column(
    spacing: 6,
    children: [
      Container(
        height: 2,
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.brown.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      Text(
        info,
        style: AppTextStyles.button.copyWith(fontSize: 13),
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
