import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_strings.dart';
import 'package:score_belote/widgets/base/check_option.dart';

class CapotSelector extends StatelessWidget {
  final bool hideDedans;
  final ValueChanged<bool> onDedansChanged;
  final ValueChanged<bool> onCapotChanged;
  final bool isCapot;
  final bool isDedans;

  const CapotSelector({
    super.key,
    required this.hideDedans,
    required this.onDedansChanged,
    required this.isCapot,
    required this.isDedans,
    required this.onCapotChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: AppCheckOption(
            label: ScoreStrings.capot,
            checked: isCapot,
            onChanged: (v) {
              onCapotChanged(v);
            },
          ),
        ),
        if (!hideDedans)
          Expanded(
            child: AppCheckOption(
              label: ScoreStrings.dedans,
              checked: isDedans,
              onChanged: (v) {
                onDedansChanged(v);
              },
            ),
          ),
      ],
    );
  }
}
