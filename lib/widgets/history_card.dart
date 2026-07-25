import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class GameHistoryItem {
  final String dateLabel; // ex: "Aujourd'hui", "Hier", "12 juillet"
  final String time; // ex: "21:14"
  final String teamAName;
  final String teamBName;
  final int scoreA;
  final int scoreB;
  final String capotWinGameName;

  const GameHistoryItem({
    required this.dateLabel,
    required this.time,
    required this.teamAName,
    required this.teamBName,
    required this.scoreA,
    required this.scoreB,
    required this.capotWinGameName,
  });

  bool get aWins => scoreA > scoreB;
}

class HistoryCard extends StatelessWidget {
  final GameHistoryItem item;

  const HistoryCard({super.key, required this.item});

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
                item.time,
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
              Expanded(child: _side(item.teamAName, item.scoreA, item.aWins)),
              const Text(
                AppStrings.versusEmoji,
                style: TextStyle(color: AppColors.wine, fontSize: 20),
              ),
              Expanded(child: _side(item.teamBName, item.scoreB, !item.aWins)),
            ],
          ),
          _aboutSection(item.capotWinGameName),
        ],
      ),
    );
  }
}

Widget _side(String name, int score, bool winner) {
  return Column(
    children: [
      Text(
        (winner ? '${AppStrings.trophyEmoji} ' : '') + name.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppTextStyles.sectionLabel.copyWith(fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        '$score',
        style: AppTextStyles.bigScore.copyWith(
          fontSize: 24,
          color: winner ? AppColors.goldDeep : AppColors.wineDeep,
        ),
      ),
    ],
  );
}

Widget _aboutSection(String roundName) {
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
        roundName.isEmpty
            ? AppStrings.classicVictory
            : "${AppStrings.CapotVictory} $roundName",
        style: AppTextStyles.button.copyWith(fontSize: 13),
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
