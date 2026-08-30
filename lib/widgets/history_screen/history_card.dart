import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/history_screen/card_theme.dart';
import 'package:score_belote/widgets/history_screen/time_badge.dart';

class HistoryCard extends StatelessWidget {
  final Game game;
  final VoidCallback onDelete;

  const HistoryCard({super.key, required this.game, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = ResultTheme.of(game.gameResultType);
    return GestureDetector(
      onTap: () => {print("tab")},
      onLongPress: () => {print("long press")},
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.cardBorder.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleSection(game.gameResultLabel, theme),
                  const SizedBox(height: 10),
                  // Équipes et scores
                  Row(
                    children: [
                      Expanded(
                        child: _side(game.teamA, game.totalScoreA, game.winner),
                      ),
                      const Text(
                        AppStrings.versusEmoji,
                        style: TextStyle(color: AppColors.wine, fontSize: 20),
                      ),
                      Expanded(
                        child: _side(game.teamB, game.totalScoreB, game.winner),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _details(game.durationLabel, game.rounds.length),

                  // if (!selectionMode)
                ],
              ),
            ),

            TimeBadge(
              time: game.createdTime,
              gradient: theme.badgeGradient,
              fg: theme.badgeFg,
            ),

            DeleteGameButton(onDelete: onDelete),
          ],
        ),
      ),
    );
  }
}

class DeleteGameButton extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteGameButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: onDelete,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.red.withValues(alpha: 0.10),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border.all(
              color: AppColors.red.withValues(alpha: 0.20),
              width: 1.5,
            ),
          ),

          child: const Center(
            child: Text('🗑️', style: TextStyle(fontSize: 14)),
          ),
        ),
      ),
    );
  }
}

Widget _titleSection(String title, ResultTheme theme) {
  return Column(
    children: [
      Row(
        children: [
          Text(theme.icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.button.copyWith(
                fontSize: 13,
                color: AppColors.wineDeep,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      Container(
        height: 1,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.wineDeep,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    ],
  );
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

Widget _details(String duration, int rounds) {
  return Row(
    children: [
      Text('Nombre de manches : $rounds', style: _footStyle()),
      Container(
        width: 1,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.wineDeep.withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      Text("Durée : $duration", style: _footStyle()),
    ],
  );
}

TextStyle _footStyle() => AppTextStyles.bodyBold.copyWith(
  fontSize: 11,
  color: AppColors.wineDeep.withValues(alpha: 0.75),
  fontWeight: FontWeight.w700,
);
