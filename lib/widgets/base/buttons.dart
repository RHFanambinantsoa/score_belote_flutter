import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

enum _ButtonVariant { primary, secondary, ghost }

/// Bouton principal — fond or, action la plus importante de l'écran
/// (ex: "Nouvelle partie", "Valider").
class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  const AppPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => _AppButtonBase(
    label: label,
    onPressed: onPressed,
    variant: _ButtonVariant.primary,
    icon: icon,
  );
}

/// Bouton secondaire — fond bordeaux, action de second plan
/// (ex: "Historique", "Annuler").
class AppSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  const AppSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => _AppButtonBase(
    label: label,
    onPressed: onPressed,
    variant: _ButtonVariant.secondary,
    icon: icon,
  );
}

/// Bouton fantôme — contour simple, action tertiaire (ex: "Paramètres").
/// Note : les maquettes utilisent un contour en pointillés ; Flutter ne
/// gère pas les bordures en pointillés nativement. Ce bouton utilise un
/// contour plein pour rester simple — ajoute le package `dotted_border`
/// si tu veux reproduire l'effet pointillé exact.
class AppGhostButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const AppGhostButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) => _AppButtonBase(
    label: label,
    onPressed: onPressed,
    variant: _ButtonVariant.ghost,
  );
}

class _AppButtonColors {
  final Color bg; // Background
  final Color shadow;
  final Color fg; // Foreground
  final Color border;

  const _AppButtonColors(this.bg, this.shadow, this.fg, this.border);
}

class _AppButtonBase extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final _ButtonVariant variant;
  final IconData? icon;

  const _AppButtonBase({
    required this.label,
    required this.variant,
    this.onPressed,
    this.icon,
  });

  @override
  State<_AppButtonBase> createState() => _AppButtonBaseState();
}

class _AppButtonBaseState extends State<_AppButtonBase> {
  bool _pressed = false;
  static const double _radius = 16;

  _AppButtonColors get _colors {
    switch (widget.variant) {
      case _ButtonVariant.primary:
        return const _AppButtonColors(
          AppColors.gold,
          AppColors.goldDeep,
          AppColors.wineDeep,
          AppColors.brown,
        );
      case _ButtonVariant.secondary:
        return const _AppButtonColors(
          AppColors.wineLight,
          AppColors.wineDeep,
          AppColors.cream,
          AppColors.brown,
        );
      case _ButtonVariant.ghost:
        return const _AppButtonColors(
          Colors.transparent,
          Colors.transparent,
          AppColors.wine,
          AppColors.wine,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _colors;
    final isGhost = widget.variant == _ButtonVariant.ghost;

    final content = Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 18, color: c.fg),
            const SizedBox(width: 8),
          ],
          Text(widget.label, style: AppTextStyles.button.copyWith(color: c.fg)),
        ],
      ),
    );

    return Opacity(
      opacity: widget.onPressed == null ? 0.4 : 1,
      child: GestureDetector(
        //écoute le doigt.
        onTapDown:
            widget.onPressed ==
                null //Quand le doigt touche
            ? null
            : (_) => setState(() => _pressed = true),
        onTapUp:
            widget.onPressed ==
                null //Quand le doigt quitte
            ? null
            : (_) => setState(() => _pressed = false),
        onTapCancel:
            widget.onPressed ==
                null //si on annule
            ? null
            : () => setState(() => _pressed = false),
        onTap: widget.onPressed, //action, appel réel
        child: SizedBox(
          height: 54,
          child: Stack(
            //Stack est un conteneur de disposition qui permet de superposer plusieurs widgets les uns sur les autres,
            //agissant comme une pile où le premier enfant est affiché en bas et le dernier en haut.
            children: [
              // Ombre pleine couleur en dessous, façon "bouton de jeu"
              if (!isGhost)
                Positioned.fill(
                  top: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: c.shadow,
                      borderRadius: BorderRadius.circular(_radius),
                    ),
                  ),
                ),
              // Face du bouton, qui descend de 4px quand on appuie
              AnimatedPositioned(
                //Le widget AnimatedPositioned est une version animée du widget Positioned
                //qui fait automatiquement transiter la position de son enfant sur une durée spécifiée chaque fois que ses propriétés de position (top, left, right, bottom) changent.
                //Il doit être utilisé comme enfant direct d'un widget Stack.
                duration: const Duration(milliseconds: 80),
                top: isGhost ? 0 : (_pressed ? 4 : 0),
                left: 0,
                right: 0,
                bottom: isGhost ? 0 : (_pressed ? 0 : 4),
                child: isGhost
                    ? DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: const Radius.circular(_radius),
                          color: c.border,
                          strokeWidth: 2.5,
                          dashPattern: const [6, 4],
                          padding: EdgeInsets.zero,
                        ),
                        child: SizedBox.expand(child: content),
                      )
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          color: c.bg,
                          borderRadius: BorderRadius.circular(_radius),
                          border: Border.all(color: c.border, width: 3),
                        ),
                        child: content,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
