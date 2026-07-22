import 'package:flutter/widgets.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class EmojiBadge extends StatelessWidget {
  final bool isLarge;
  const EmojiBadge({super.key, required this.isLarge});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLarge ? 128 : 84,
      height: isLarge ? 128 : 84,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.wineLight, AppColors.wineDeep],
          center: Alignment(-0.3, -0.4),
        ),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.gold, width: isLarge ? 4 : 3),
        ),
      ),
      alignment: Alignment.center,
      child: Text('🤔', style: TextStyle(fontSize: isLarge ? 58 : 36)),
    );
  }
}
