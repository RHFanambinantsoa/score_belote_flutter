import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Une ligne "libellé / valeur" du tableau de référence.
class RuleRow {
  final String label;
  final String value;
  const RuleRow(this.label, this.value);
}

/// Petite carte listant des lignes libellé/valeur — utilisée pour les
/// tableaux de référence (score normal, multiplicateurs, ordre des
/// cartes...). Optionnellement précédée d'un petit titre de sous-section.
class RuleTable extends StatelessWidget {
  final String? heading;
  final List<RuleRow> rows;

  const RuleTable({super.key, this.heading, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 14, 0, 6),
            child: Text(
              heading!.toUpperCase(),
              style: AppTextStyles.sectionLabel.copyWith(
                fontSize: 11,
                color: AppColors.wine.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.cream2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.brown.withValues(alpha: 0.15),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < rows.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    border: i < rows.length - 1
                        ? Border(
                            bottom: BorderSide(
                              color: AppColors.brown.withValues(alpha: 0.1),
                            ),
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rows[i].label,
                        style: AppTextStyles.bodyBold.copyWith(fontSize: 13),
                      ),
                      Text(
                        rows[i].value,
                        style: AppTextStyles.button.copyWith(
                          fontSize: 13,
                          color: AppColors.goldDeep,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
