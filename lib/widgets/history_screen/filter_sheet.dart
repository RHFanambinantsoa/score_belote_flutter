import 'package:flutter/material.dart';
import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class FilterSheet extends StatefulWidget {
  final TextEditingController teamController;

  final DateTime? selectedDate;
  final GameResultType? selectedResultType;

  final ValueChanged<DateTime?> onDateChanged;
  final ValueChanged<GameResultType?> onResultChanged;

  final VoidCallback onReset;
  final VoidCallback onApply;

  const FilterSheet({
    super.key,
    required this.teamController,
    required this.selectedDate,
    required this.selectedResultType,
    required this.onDateChanged,
    required this.onResultChanged,
    required this.onReset,
    required this.onApply,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late DateTime? _selectedDate;
  late GameResultType? _selectedResultType;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.selectedDate;
    _selectedResultType = widget.selectedResultType;
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date == null) return;

    setState(() {
      _selectedDate = date;
    });

    widget.onDateChanged(date);
  }

  void _changeResult(GameResultType? result) {
    setState(() {
      _selectedResultType = result;
    });

    widget.onResultChanged(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        22,
        10,
        22,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        border: Border(top: BorderSide(color: AppColors.brown, width: 4)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.brown.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🔍', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(HistoryStrings.filters, style: AppTextStyles.modalTitle),
              ],
            ),
            const SizedBox(height: 16),

            // --- Équipe ---
            Text(AppStrings.team, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.cream2,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.brown, width: 2.5),
              ),
              child: TextField(
                controller: widget.teamController,
                style: AppTextStyles.bodyBold,
                cursorColor: AppColors.wine,
                decoration: InputDecoration(
                  hintText: AppStrings.teamInputHint,
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.wine.withValues(alpha: 0.4),
                  ),
                  prefixText: '🔍  ',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Date ---
            Text(HistoryStrings.date, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cream2,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.brown, width: 2.5),
                ),
                child: Row(
                  children: [
                    const Text('📅', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? HistoryStrings.allDates
                            : '${_selectedDate!.day.toString().padLeft(2, '0')}/'
                                  '${_selectedDate!.month.toString().padLeft(2, '0')}/'
                                  '${_selectedDate!.year}',
                        style: AppTextStyles.bodyBold,
                      ),
                    ),
                    const Text(
                      '›',
                      style: TextStyle(color: AppColors.wine, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Résultat ---
            Text(HistoryStrings.result, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.cream2,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.brown, width: 2.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<GameResultType?>(
                  initialValue: _selectedResultType,
                  icon: const Text('🏆', style: TextStyle(fontSize: 15)),
                  isExpanded: true,
                  style: AppTextStyles.bodyBold,
                  dropdownColor: AppColors.cream2,
                  borderRadius: BorderRadius.circular(14),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: null,
                      child: Text(HistoryStrings.allResult),
                    ),
                    DropdownMenuItem(
                      value: GameResultType.classicVictory,
                      child: Text(HistoryStrings.classicVictory),
                    ),
                    DropdownMenuItem(
                      value: GameResultType.capotVictory,
                      child: Text(HistoryStrings.capotVictory),
                    ),
                    DropdownMenuItem(
                      value: GameResultType.abandoned,
                      child: Text(HistoryStrings.abandonnedGame),
                    ),
                  ],
                  onChanged: _changeResult,
                ),
              ),
            ),

            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 4),

            Row(
              children: [
                Expanded(
                  child: AppSecondaryButton(
                    label: AppStrings.reset,
                    onPressed: widget.onReset,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppPrimaryButton(
                    label: AppStrings.apply,
                    onPressed: widget.onApply,
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
