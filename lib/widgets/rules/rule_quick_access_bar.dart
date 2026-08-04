import 'package:flutter/material.dart';
import 'package:score_belote/constants/rule_data.dart';
import 'package:score_belote/models/rule_content.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/rules/rule_block_view.dart';

class RuleQuickAccessBar extends StatelessWidget {
  final List<RuleTableReferenceCategory> referenceCategories;

  const RuleQuickAccessBar({super.key, required this.referenceCategories});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cream,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
      child: SizedBox(
        height: 44,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: referenceCategories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, i) => _QuickAccessChip(
            table: referenceCategories[i],
            onTap: () => _openTableSheet(context, referenceCategories[i]),
          ),
        ),
      ),
    );
  }

  void _openTableSheet(BuildContext context, RuleTableReferenceCategory table) {
    showModalBottomSheet(
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
          padding: EdgeInsets.symmetric(vertical: 25),
          child: RuleBlocksView(blocks: table.blocks, glossary: ruleGlossary),
        ),
      ),
    );
  }
}

class _QuickAccessChip extends StatefulWidget {
  final RuleTableReferenceCategory table;
  final VoidCallback onTap;
  const _QuickAccessChip({required this.table, required this.onTap});

  @override
  State<_QuickAccessChip> createState() => _QuickAccessChipState();
}

class _QuickAccessChipState extends State<_QuickAccessChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final label = widget.table.label;
    final icon = widget.table.icon;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
        padding: const EdgeInsets.only(left: 6, right: 14),
        decoration: BoxDecoration(
          color: AppColors.cream2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.brown.withValues(alpha: 0.55),
            width: 2,
          ),
          boxShadow: _pressed
              ? []
              : [
                  BoxShadow(
                    color: AppColors.brown.withValues(alpha: 0.18),
                    offset: const Offset(0, 3),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: AppTextStyles.button.copyWith(
                fontSize: 14,
                color: AppColors.wineDeep,
              ),
            ),
            SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.button.copyWith(
                fontSize: 12.5,
                color: AppColors.wineDeep,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
