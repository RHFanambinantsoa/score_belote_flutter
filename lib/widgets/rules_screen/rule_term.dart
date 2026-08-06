import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Terme technique souligné en pointillé — un tap ouvre une petite fiche
/// explicative en bottom sheet, sans quitter l'écran des règles.
///
/// Utilisation dans un Text.rich :
/// ```dart
/// Text.rich(TextSpan(children: [
///   const TextSpan(text: 'La Belote Gasy se joue avec des '),
///   RuleTerm.span(context, label: 'cartes françaises', title: '...', body: Widget...),
///   const TextSpan(text: ', comme la belote classique.'),
/// ]))
/// ```
class RuleTerm {
  /// Construit un TextSpan cliquable à insérer dans un Text.rich.
  static InlineSpan span(
    BuildContext context, {
    required String label,
    required String title,
    required Widget body,
    String icon = '📖',
  }) {
    return TextSpan(
      text: label,
      style: AppTextStyles.bodyBold.copyWith(
        fontSize: 12.5,
        color: AppColors.wine,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dotted,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () =>
            showTermSheet(context, title: title, body: body, icon: icon),
    );
  }

  static Future<void> showTermSheet(
    BuildContext context, {
    required String title,
    required Widget body,
    String icon = '📖',
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.fromLTRB(22, 10, 22, 24),
        decoration: const BoxDecoration(
          color: AppColors.cream,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
          border: Border(top: BorderSide(color: AppColors.brown, width: 4)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.brown.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(icon, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: AppTextStyles.modalTitle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
