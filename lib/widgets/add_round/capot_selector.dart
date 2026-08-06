import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/widgets/base/check_option.dart';

class CapotSelector extends StatelessWidget {
  final bool displayDedans;
  final ValueChanged<bool> onDedansChanged;
  final ValueChanged<bool> onCapotChanged;
  final bool isCapot;
  final bool isDedans;

  const CapotSelector({
    super.key,
    required this.displayDedans,
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
            label: AppStrings.capot,
            checked: isCapot,
            onChanged: (v) {
              onCapotChanged(v);
            },
          ),
        ),
        if (displayDedans)
          Expanded(
            child: AppCheckOption(
              label: AppStrings.dedans,
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
