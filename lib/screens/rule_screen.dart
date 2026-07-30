import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/rule_data.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/rule_accordeon_section.dart';
import 'package:score_belote/widgets/rules/rule_block_view.dart';
import 'package:score_belote/widgets/topbar.dart';
import '../theme/app_colors.dart';
import '../widgets/rules/rule_table.dart' as table_widget;

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: const AppTopBar(title: 'Règles du jeu'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
        children: [
          for (final section in ruleSections)
            RuleAccordionSection(
              number: section.number,
              title: section.title,
              initiallyOpen: section.initiallyOpen,
              child: RuleBlocksView(
                blocks: section.blocks,
                glossary: ruleGlossary,
              ),
            ),

          const SizedBox(height: 6),
          _sectionDivider('Tableaux de référence'),

          for (int i = 0; i < ruleReferenceTables.length; i++) ...[
            table_widget.RuleTable(
              heading: ruleReferenceTables[i].heading,
              rows: ruleReferenceTables[i].rows
                  .map((r) => table_widget.RuleRow(r.label, r.value))
                  .toList(),
            ),
            if (i < ruleReferenceTables.length - 1) const SizedBox(height: 12),
          ],

          const SizedBox(height: 10),
          Text(
            '* Réglable dans les paramètres selon la préférence des joueurs.',
            style: AppTextStyles.body.copyWith(
              fontSize: 11,
              color: AppColors.wine.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionDivider(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: AppTextStyles.button.copyWith(
              fontSize: 13,
              color: AppColors.wine,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 2,
              color: AppColors.brown.withValues(alpha: 0.15),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubHeading extends StatelessWidget {
  final String text;
  const _SubHeading(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      text,
      style: AppTextStyles.sectionLabel.copyWith(fontSize: 11.5),
    ),
  );
}
