import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/widgets/rule_accordeon_section.dart';
import 'package:score_belote/widgets/topbar.dart';
import '../theme/app_colors.dart';

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
          RuleAccordionSection(
            number: '0. ',
            title: BeloteRule.authorNoteTitle,
            initiallyOpen: false,
            child: Column(
              spacing: 8,
              children: [
                ...BeloteRule.authorNoteParagraphs.map(
                  (text) => RuleParagraph(text),
                ),
              ],
            ),
          ),

          RuleAccordionSection(
            number: '1.',
            title: BeloteRule.gamePresentationTitle,
            initiallyOpen: true,
            child: Column(
              spacing: 8,
              children: [
                ...BeloteRule.gamePresentationParagraphs.map(
                  (text) => RuleParagraph(text),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RuleExample(BeloteRule.gamePresentationNote),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
