import 'package:flutter/material.dart';
import 'package:score_belote/enums/game_variant.dart';
import '../theme/app_colors.dart';

/// Ajoute des propriétés d'affichage à GameVariant.
/// L'enum reste uniquement responsable des valeurs possibles,
/// tandis que cette extension gère les informations utilisées par l'UI
/// (symbole, couleur, label...).
extension GameVariantUIExtension on GameVariant {
  String get symbol => switch (this) {
    GameVariant.clubs => '♣',
    GameVariant.diamonds => '♦',
    GameVariant.hearts => '♥',
    GameVariant.spades => '♠',
    GameVariant.noTrump => GameVariant.noTrump.label,
    GameVariant.allTrump => GameVariant.allTrump.label,
  };

  bool get isRed => this == GameVariant.diamonds || this == GameVariant.hearts;
}

class GameVariantSelector extends StatelessWidget {
  final GameVariant? selected;
  final ValueChanged<GameVariant> onSelected;

  const GameVariantSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  static const _suits = [
    GameVariant.clubs,
    GameVariant.diamonds,
    GameVariant.hearts,
    GameVariant.spades,
  ];

  static const _others = [GameVariant.noTrump, GameVariant.allTrump];

  Widget _buildButton(GameVariant variant, bool isActive) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isActive ? AppColors.gold : AppColors.cream2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.brown, width: 2.5),
        boxShadow: isActive
            ? const [BoxShadow(color: AppColors.goldDeep, offset: Offset(0, 4))]
            : null,
      ),
      child: Center(
        child: Text(
          variant.symbol,
          style: TextStyle(
            fontFamily: "Nunito",
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: isActive
                ? AppColors.wineDeep
                : (variant.isRed ? AppColors.red : AppColors.wineDeep),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<GameVariant> variants, {bool square = false}) {
    return Row(
      children: variants.map((variant) {
        final isActive = variant == selected;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () => onSelected(variant),
              child: square
                  ? AspectRatio(
                      aspectRatio: 1,
                      //pour avoir un bouton carré
                      child: _buildButton(variant, isActive),
                    )
                  : SizedBox(
                      height: 60,
                      child: _buildButton(variant, isActive),
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(_suits, square: true),
        const SizedBox(height: 12),
        _buildRow(_others),
      ],
    );
  }
}
