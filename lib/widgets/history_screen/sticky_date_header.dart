import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/widgets/history_screen/grouped_date_label.dart';

class StickyDateHeader extends SliverPersistentHeaderDelegate {
  final String text;

  StickyDateHeader({required this.text});

  @override
  double get minExtent => 40;

  @override
  double get maxExtent => 40;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.cream,
      child: GroupedDateLabel(text: text),
    );
  }

  @override
  bool shouldRebuild(covariant StickyDateHeader oldDelegate) {
    return oldDelegate.text != text;
  }
}
