import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/widgets/base/switch_option.dart';

class SplitOption extends StatelessWidget {
  final bool display;
  final bool isSplit;
  final ValueChanged<bool> onChanged;

  const SplitOption({
    super.key,
    required this.isSplit,
    required this.display,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (display)
          Expanded(
            child: SwitchOption(
              label: AppStrings.splitScoreMode,
              value: isSplit,
              onChanged: (v) => onChanged(v),
            ),
          ),
      ],
    );
  }
}
