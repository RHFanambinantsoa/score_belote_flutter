import 'package:flutter/material.dart';
import 'package:score_belote/constants/fake_datas.dart';
import 'package:score_belote/screens/history_screen.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/screens/settings_screen.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/emoji_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //declatation des fuctions
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmojiBadge(isLarge: true),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'SCORE', style: AppTextStyles.appTitle),
                    TextSpan(
                      text: '?',
                      style: AppTextStyles.appTitle.copyWith(
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                AppStrings.slogan,
                style: AppTextStyles.sectionLabel.copyWith(letterSpacing: 2),
              ),
              const SizedBox(height: 40),
              AppPrimaryButton(
                label: AppStrings.newGame,
                onPressed: () => _navigateTo(context, const NewGameScreen()),
              ),

              const SizedBox(height: 12),
              AppSecondaryButton(
                label: AppStrings.history,
                onPressed: () => _navigateTo(
                  context,
                  HistoryScreen(items: FakeDatas.fakeItems),
                ),
              ),
              const SizedBox(height: 12),
              AppGhostButton(
                label: AppStrings.settings,
                onPressed: () => _navigateTo(context, const SettingsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
