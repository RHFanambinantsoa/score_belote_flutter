import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class TimeBadge extends StatelessWidget {
  final String time;
  final List<Color> gradient;
  final Color fg;
  const TimeBadge({
    super.key,
    required this.time,
    required this.gradient,
    required this.fg,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -10,
      right: 14,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.brown, width: 2.5),
          boxShadow: [
            BoxShadow(color: gradient.last, offset: const Offset(0, 3)),
          ],
        ),
        child: Text(
          time,
          style: AppTextStyles.button.copyWith(fontSize: 11, color: fg),
        ),
      ),
    );
  }
}
