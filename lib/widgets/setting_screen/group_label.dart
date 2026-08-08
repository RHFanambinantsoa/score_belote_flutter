import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class GroupLabel extends StatelessWidget {
  final String label;

  const GroupLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.sectionLabel.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
