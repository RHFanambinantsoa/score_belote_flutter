import 'package:flutter/material.dart';
import 'package:score_belote/enums/box_info_type.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class BoxInfo extends StatelessWidget {
  final String text;
  final BoxInfoType type;
  const BoxInfo({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(8),
              border: Border(
                left: BorderSide(
                  color: switch (type) {
                    BoxInfoType.note => AppColors.green,
                    BoxInfoType.example => AppColors.gold,
                    BoxInfoType.warning => AppColors.red,
                  },
                  width: 3,
                ),
              ),
            ),
            child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
