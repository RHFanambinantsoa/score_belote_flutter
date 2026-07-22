import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Deux familles, comme sur les maquettes :
/// - Baloo 2 pour les titres, boutons, chiffres (même esprit arrondi que
///   le lettrage "SCORE" du logo)
/// - Nunito pour le texte courant

class AppTextStyles {
  AppTextStyles._();

  static const String _balooFont = "Baloo2";
  static const String _nunitoFont = "Nunito";

  /// Corps de texte courant
  static TextStyle get body => const TextStyle(
    fontFamily: _balooFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.brown,
  );

  static TextStyle get bodyBold => const TextStyle(
    fontFamily: _nunitoFont,
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColors.wineDeep,
  );

  /// Texte des boutons
  static TextStyle get button => const TextStyle(
    fontFamily: _balooFont,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get backButton => const TextStyle(
    fontFamily: _balooFont,
    fontSize: 30,
    color: AppColors.gold,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  /// Titre de topbar (fond bordeaux)
  static TextStyle get screenTitle => const TextStyle(
    fontFamily: _balooFont,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.cream,
  );
}
