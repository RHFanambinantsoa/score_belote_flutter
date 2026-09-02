import 'package:score_belote/enums/game_status.dart';
import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';

class ResultTheme {
  final String icon;
  final Color cardBg;
  final Color cardBorder;
  final List<Color> badgeGradient;
  final Color badgeFg;

  const ResultTheme({
    required this.icon,
    required this.cardBg,
    required this.cardBorder,
    required this.badgeGradient,
    required this.badgeFg,
  });

  static ResultTheme of(GameResultType type) {
    switch (type) {
      case GameResultType.classicVictory:
        // Cas standard : fond crème habituel, badge doré — cohérent avec
        // le reste de l'app.
        return const ResultTheme(
          icon: '🎉',
          cardBg: AppColors.cream2,
          cardBorder: AppColors.brown,
          badgeGradient: [AppColors.gold, AppColors.goldDeep],
          badgeFg: AppColors.wineDeep,
        );
      case GameResultType.capotVictory:
        // Résultat plus rare et plus fort : fond légèrement doré, badge
        // inversé (fond bordeaux, symbole doré) pour marquer le contraste.
        return ResultTheme(
          icon: '🔥',
          cardBg: Color.lerp(AppColors.cream2, AppColors.gold, 0.30)!,
          cardBorder: AppColors.goldDeep,
          badgeGradient: const [AppColors.wineLight, AppColors.wineDeep],
          badgeFg: AppColors.gold,
        );
      case GameResultType.abandoned:
        // Événement négatif/incomplet : teinte rouge discrète, badge rouge.
        return ResultTheme(
          icon: '⏸',
          cardBg: Color.lerp(AppColors.cream2, AppColors.red, 0.12)!,
          cardBorder: AppColors.red,
          badgeGradient: const [AppColors.red, Color(0xFF7E2A20)],
          badgeFg: AppColors.cream,
        );
    }
  }
}
