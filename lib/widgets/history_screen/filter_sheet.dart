import 'package:flutter/material.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/models/filter_fields.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class FilterSheet extends StatefulWidget {
  final String initialTeam;
  final DateTime? initialDate;
  final GameResultType? initialResultType;

  const FilterSheet({
    super.key,
    this.initialTeam = '',
    this.initialDate,
    this.initialResultType,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late final TextEditingController _teamController;
  late DateTime? _selectedDate;
  late GameResultType? _selectedResultType;

  @override
  void initState() {
    super.initState();

    _teamController = TextEditingController(text: widget.initialTeam);

    _selectedDate = widget.initialDate;
    _selectedResultType = widget.initialResultType;
  }

  @override
  void dispose() {
    _teamController.dispose();
    super.dispose();
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
  }

  void _resetFilters() {
    setState(() {
      _teamController.clear();
      _selectedDate = null;
      _selectedResultType = null;
    });
  }

  void _applyFilters() {
    Navigator.pop(
      context,
      FilterFields(
        team: _teamController.text.trim(),
        date: _selectedDate,
        resultType: _selectedResultType,
      ),
    );
  }

  String get _dateLabel {
    if (_selectedDate == null) {
      return 'Toutes les dates';
    }

    return '${_selectedDate!.day.toString().padLeft(2, '0')}/'
        '${_selectedDate!.month.toString().padLeft(2, '0')}/'
        '${_selectedDate!.year}';
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
                const Icon(Icons.tune, size: 20, color: AppColors.wine),
                const SizedBox(width: 8),
                Text('Filtres', style: AppTextStyles.modalTitle),
              ],
            ),

            const SizedBox(height: 16),

            // ÉQUIPE
            Text('ÉQUIPE', style: AppTextStyles.sectionLabel),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.cream2,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.brown, width: 2.5),
              ),
              child: TextField(
                controller: _teamController,
                style: AppTextStyles.bodyBold,
                cursorColor: AppColors.wine,
                decoration: InputDecoration(
                  hintText: 'Nom de l’équipe',
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.wine.withValues(alpha: 0.4),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.wine,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // DATE
            Text('DATE', style: AppTextStyles.sectionLabel),

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
                    const Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: AppColors.wine,
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(_dateLabel, style: AppTextStyles.bodyBold),
                    ),

                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.wine,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // RÉSULTAT
            Text('RÉSULTAT', style: AppTextStyles.sectionLabel),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.cream2,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.brown, width: 2.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<GameResultType?>(
                  value: _selectedResultType,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.emoji_events,
                    color: AppColors.wine,
                    size: 20,
                  ),
                  style: AppTextStyles.bodyBold,
                  dropdownColor: AppColors.cream2,
                  borderRadius: BorderRadius.circular(14),

                  items: const [
                    DropdownMenuItem<GameResultType?>(
                      value: null,
                      child: Text('Tous les résultats'),
                    ),
                    DropdownMenuItem<GameResultType?>(
                      value: GameResultType.classicVictory,
                      child: Text(HistoryStrings.classicVictory),
                    ),
                    DropdownMenuItem<GameResultType?>(
                      value: GameResultType.capotVictory,
                      child: Text(HistoryStrings.capotVictory),
                    ),
                    DropdownMenuItem<GameResultType?>(
                      value: GameResultType.abandoned,
                      child: Text(HistoryStrings.abandonnedGame),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      _selectedResultType = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Divider(),

            const SizedBox(height: 4),

            // BOUTONS
            Row(
              children: [
                Expanded(
                  child: AppGhostButton(
                    label: 'Réinitialiser',
                    onPressed: _resetFilters,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: AppPrimaryButton(
                    label: 'Appliquer',
                    onPressed: _applyFilters,
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
