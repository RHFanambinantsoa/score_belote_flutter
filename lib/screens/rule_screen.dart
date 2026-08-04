import 'package:flutter/material.dart';
import 'package:score_belote/constants/rule_data.dart';
import 'package:score_belote/widgets/rule_accordeon_section.dart';
import 'package:score_belote/widgets/rules/rule_block_view.dart';
import 'package:score_belote/widgets/rules/rule_quick_access_bar.dart';
import 'package:score_belote/widgets/topbar.dart';
import '../theme/app_colors.dart';
import 'package:score_belote/constants/app_strings.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: const AppTopBar(title: AppStrings.gameRules),
      body: Column(
        children: [
          RuleQuickAccessBar(referenceCategories: quickAccessCategories),
          Container(height: 2, color: AppColors.brown.withValues(alpha: 0.1)),
          Expanded(
            child: ListView(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
