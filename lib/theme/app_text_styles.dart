import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Deux familles, comme sur les maquettes :
/// - Baloo 2 pour les titres, boutons, chiffres (même esprit arrondi que
///   le lettrage "SCORE" du logo)
/// - Nunito pour le texte courant

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _nunito => GoogleFonts.nunito();
  static TextStyle get _baloo => GoogleFonts.baloo2();

  /// Corps de texte courant
  static TextStyle get body => _nunito.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.brown,
  );

  static TextStyle get bodyBold => _nunito.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColors.wineDeep,
  );

  /// Texte des boutons
  static TextStyle get button =>
      _baloo.copyWith(fontSize: 17, fontWeight: FontWeight.w700);
}
