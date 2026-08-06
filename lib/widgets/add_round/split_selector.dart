import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/models/split_score.dart';
import 'package:score_belote/widgets/add_round/group_label.dart';
import 'package:score_belote/widgets/base/radio_option.dart';

class SplitSelector extends StatelessWidget {
  final List<SplitScore> splits;
  final SplitScore selected;
  final ValueChanged<SplitScore> onChanged;

  const SplitSelector({
    super.key,
    required this.splits,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupLabel(label: AppStrings.splitValues),
        Column(
          spacing: 4,
          children: [
            ...splits.map(
              (splitScore) => AppRadioOption<SplitScore>(
                value: splitScore,
                groupValue: selected,
                label:
                    " ${splitScore.defenderScore} - ${splitScore.callerScore} ",
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
