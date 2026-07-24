import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Modal de confirmation générique — "Voulez-vous vraiment quitter ?",
/// "Voulez-vous vraiment supprimer l'historique ?", etc.
///
/// Usage :
/// ```dart
/// final confirmed = await AppConfirmDialog.show(
///   context,
///   title: 'Quitter la partie ?',
///   message: 'Une partie est en cours. Si tu quittes maintenant, '
///       'la progression de cette manche sera perdue.',
///   confirmLabel: 'Quitter',
///   isDestructive: true,
/// );
/// if (confirmed == true) { ... }
/// ```
class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final bool isDestructive;
  final String icon;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirmer',
    this.cancelLabel = 'Annuler',
    this.isDestructive = false,
    this.icon = '⚠️',
  });

  /// Ouvre le modal et renvoie `true` si l'utilisateur confirme,
  /// `false` si annulé, `null` si fermé par un tap en dehors.
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirmer',
    String cancelLabel = 'Annuler',
    bool isDestructive = false,
    String icon = '⚠️',
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: const Color(
        0x8D14080C,
      ), // rgba(20,8,12,0.55), comme les maquettes
      builder: (_) => AppConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final confirmColor = isDestructive ? AppColors.red : AppColors.gold;
    final confirmShadow = isDestructive
        ? const Color(0xFF7E2A20)
        : AppColors.goldDeep;
    final confirmFg = isDestructive ? AppColors.cream : AppColors.wineDeep;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
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
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: confirmColor.withValues(alpha: 0.16),
                shape: BoxShape.circle,
                border: Border.all(color: confirmColor, width: 2),
              ),
              child: Text(icon, style: const TextStyle(fontSize: 22)),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.modalTitle,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(height: 1.45, fontSize: 13.5),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: cancelLabel,
                    bg: AppColors.wineLight,
                    shadow: AppColors.wineDeep,
                    fg: AppColors.cream,
                    onTap: () => Navigator.of(context).pop(false),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DialogButton(
                    label: confirmLabel,
                    bg: confirmColor,
                    shadow: confirmShadow,
                    fg: confirmFg,
                    onTap: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Petit bouton local (même esprit "bouton de jeu" que AppPrimaryButton),
/// gardé ici pour pouvoir paramétrer la couleur du bouton de confirmation
/// selon isDestructive sans complexifier buttons.dart.
class _DialogButton extends StatefulWidget {
  final String label;
  final Color bg;
  final Color shadow;
  final Color fg;
  final VoidCallback onTap;

  const _DialogButton({
    required this.label,
    required this.bg,
    required this.shadow,
    required this.fg,
    required this.onTap,
  });

  @override
  State<_DialogButton> createState() => _DialogButtonState();
}

class _DialogButtonState extends State<_DialogButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Positioned.fill(
              top: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.shadow,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 80),
              top: _pressed ? 4 : 0,
              left: 0,
              right: 0,
              bottom: _pressed ? 0 : 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.bg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.brown, width: 2.5),
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.button.copyWith(
                      fontSize: 14,
                      color: widget.fg,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
