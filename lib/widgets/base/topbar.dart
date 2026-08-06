import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Barre du haut : flèche "‹" jaune pour revenir au menu, titre centré,
/// et un slot optionnel à droite (ex: l'icône Paramètres pendant une
/// partie). Si `trailing` est null, un espaceur invisible de la même
/// largeur que la flèche garde le titre bien centré.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing; //un widget optionnel à droite
  final VoidCallback? onBack;
  final bool showDot;

  const AppTopBar({
    super.key,
    required this.title,
    this.trailing,
    this.onBack,
    this.showDot = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: const BoxDecoration(
        color: AppColors.wine,
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 4)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
              child: SizedBox(
                width: 34,
                height: 34,
                child: Center(
                  child: Text('‹', style: AppTextStyles.backButton),
                ),
              ),
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: title, style: AppTextStyles.screenTitle),

                    TextSpan(
                      text: showDot ? "." : "?",
                      style: AppTextStyles.screenTitle.copyWith(
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 34, height: 34, child: trailing),
          ],
        ),
      ),
    );
  }
}
