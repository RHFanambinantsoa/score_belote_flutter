import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_strings.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/widgets/base/radio_option.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class RoundStatusSelector extends StatelessWidget {
  final RoundStatus selected;
  final bool hideRedouble;
  final ValueChanged<RoundStatus> onChanged;

  const RoundStatusSelector({
    super.key,
    required this.selected,
    required this.hideRedouble,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final availableStatuses = hideRedouble
        ? RoundStatus.withoutRedoubled
        : RoundStatus.values;

    return Column(
      spacing: 4,
      children: [
        Text(ScoreStrings.mode, style: AppTextStyles.sectionLabel),

        ...availableStatuses.map(
          (roundStatus) => AppRadioOption<RoundStatus>(
            value: roundStatus,
            groupValue: selected,
            label: roundStatus.label,
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
