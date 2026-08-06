import 'package:flutter/material.dart';
import 'package:score_belote/enums/box_info_type.dart';
import 'package:score_belote/services/rule_text_parser.dart';
import '../../models/rule_content.dart';
import '../../theme/app_text_styles.dart';
import 'rule_table.dart' as table_widget;
import 'rule_term.dart';
import 'box_info.dart';

/// Transforme une liste de [RuleBlock] en widgets, dans l'ordre, avec un
/// espacement cohérent entre chaque bloc. C'est le seul point d'entrée à
/// utiliser depuis un écran : `RuleBlocksView(blocks: section.blocks)`.
class RuleBlocksView extends StatelessWidget {
  final List<RuleBlock> blocks;
  final Map<String, RuleGlossaryTerm> glossary;

  const RuleBlocksView({
    super.key,
    required this.blocks,
    required this.glossary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < blocks.length; i++) ...[
          if (i > 0) SizedBox(height: _spacingBefore(blocks[i])),
          _RuleBlockView(block: blocks[i], glossary: glossary),
        ],
      ],
    );
  }

  double _spacingBefore(RuleBlock block) => block is RuleSubtitle ? 10 : 6;
  //plus petite espace pour les sous titres
}

class _RuleBlockView extends StatelessWidget {
  final RuleBlock block;
  final Map<String, RuleGlossaryTerm> glossary;
  const _RuleBlockView({required this.block, required this.glossary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: switch (block) {
            RuleSubtitle(:final text) => Text(
              text,
              style: AppTextStyles.sectionLabel.copyWith(fontSize: 11.5),
            ),

            RuleParagraph(:final text) => _RichParagraph(
              text: text,
              glossary: glossary,
            ),
            //pattern matching
            //equivalent à
            //       if (block is RuleParagraph) {
            //   final text = block.text;

            //   return _RichParagraph(
            //     text: text,
            //     glossary: glossary,
            //   );
            // }
            RuleExample(:final text) => BoxInfo(
              text: text,
              type: BoxInfoType.example,
            ),
            RuleNote(:final text) => BoxInfo(
              text: text,
              type: BoxInfoType.note,
            ),
            RuleWarning(:final text) => BoxInfo(
              text: text,
              type: BoxInfoType.warning,
            ),
            RuleTableBlock(:final heading, :final rows) =>
              table_widget.RuleTable(
                heading: heading,
                rows: rows
                    .map((r) => table_widget.RuleRow(r.label, r.value))
                    .toList(),
              ),
          },
        ),
      ],
    );
  }
}

/// Affiche un paragraphe en remplaçant chaque `{{terme}}` par un span
/// cliquable, résolu depuis le glossaire de l'écran.
class _RichParagraph extends StatelessWidget {
  final String text;
  final Map<String, RuleGlossaryTerm> glossary;
  const _RichParagraph({required this.text, required this.glossary});

  @override
  Widget build(BuildContext context) {
    final baseStyle = AppTextStyles.body.copyWith(fontSize: 12.5, height: 1.55);
    final spans = parseRuleText(text);
    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: spans.map((sp) {
          final term = glossary[sp.text];
          if (sp.isTerm && term != null) {
            return RuleTerm.span(
              context,
              label: sp.text,
              title: term.title,
              icon: term.icon,
              body: RuleBlocksView(blocks: term.body, glossary: glossary),
            );
          }
          return TextSpan(text: sp.text);
        }).toList(),
      ),
    );
  }
}
