import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/constants/settings_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/modals/confirm_modal.dart';

class AppDeleteHistoryButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppDeleteHistoryButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () async {
            final confirmed = await AppConfirmDialog.show(
              context,
              title: HistoryStrings.deleteHistoryModalTitle,
              message: HistoryStrings.deleteHistoryModalMessage,
              confirmLabel: AppStrings.delete,
              isDestructive: true,
              icon: AppStrings.binEmoji,
            );
            if (confirmed == true) {
              onPressed!();
              //execution de la fonction ou onPressed?.call()
              // todo : suppresssion de l'historique
            }
          },
          child: _valueRow(
            context,
            SettingsStrings.deleteHistory,
            SettingsStrings.reset,
            valueColor: AppColors.red,
          ),
        ),
      ),
    ],
  );
}

Widget _valueRow(
  dynamic context,
  String label,
  String value, {
  Color? valueColor,
}) => _rowContainer(
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: AppTextStyles.bodyBold.copyWith(fontSize: 14)),
      Text(
        value,
        style: AppTextStyles.button.copyWith(
          fontSize: 13,
          color: valueColor ?? AppColors.wine,
        ),
      ),
    ],
  ),
);

Widget _rowContainer(Widget child) => Container(
  margin: const EdgeInsets.only(bottom: 10),
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  decoration: BoxDecoration(
    color: AppColors.cream2,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: AppColors.brown.withValues(alpha: 0.15),
      width: 2,
    ),
  ),
  child: child,
);
