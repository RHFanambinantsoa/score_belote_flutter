import 'package:flutter/material.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off_rounded, size: 70, color: AppColors.wine),
              const SizedBox(height: 20),
              Text(
                'Page introuvable',
                style: AppTextStyles.modalTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Désolé, cette page n’existe pas ou n’est plus disponible.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              AppPrimaryButton(
                label: 'Retour à l’accueil',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
