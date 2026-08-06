import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class ActionButtonsSection extends StatelessWidget {
  final VoidCallback? onSubmitPressed;
  final VoidCallback? onCancelPressed;

  const ActionButtonsSection({
    super.key,
    required this.onSubmitPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppSecondaryButton(
            label: AppStrings.cancel,
            onPressed: onCancelPressed,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppPrimaryButton(
            label: AppStrings.submit,
            onPressed: onSubmitPressed,
          ),
        ),
      ],
    );
  }
}
