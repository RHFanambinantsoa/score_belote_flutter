import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/widgets/emoji_badge.dart';
import 'package:score_belote/widgets/warning_box.dart';
import 'home_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        //Empêche le contenu de passer sous
        // l'encoche
        // la barre de notification
        // les coins arrondis
        // la barre de navigation
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              //Column aura au minimum la hauteur de l'écran.
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              //edgeInsets.all permet de mettre un padding de 24 pixels sur tous les côtés du widget enfant
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisAlignment.center permet de centrer les widgets enfants sur l'axe principal (vertical dans ce cas)
                children: [
                  EmojiBadge(isLarge: false),
                  const SizedBox(height: 14),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Bienvenue sur '),
                        TextSpan(
                          text: 'SCORE',
                          style: AppTextStyles.appTitle.copyWith(fontSize: 20),
                        ),
                        TextSpan(
                          text: '?',
                          style: AppTextStyles.appTitle.copyWith(
                            fontSize: 22,
                            color: AppColors.gold,
                          ),
                        ),
                      ],
                      style: AppTextStyles.appTitle.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    AppStrings.welcomeDescription,
                    style: AppTextStyles.body.copyWith(height: 1.55),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  WarningBox(),
                  const SizedBox(height: 14),
                  AppPrimaryButton(
                    label: AppStrings.startGame,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
