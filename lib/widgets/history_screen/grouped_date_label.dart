import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class GroupedDateLabel extends StatelessWidget {
  final String text;
  const GroupedDateLabel({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.sectionLabel.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
