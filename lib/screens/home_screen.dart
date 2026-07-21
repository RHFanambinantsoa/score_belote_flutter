import 'package:flutter/material.dart';
import 'package:score_belote/screens/history_screen.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/screens/settings_screen.dart';
import 'package:score_belote/widgets/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //declatation des fuctions
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("bienvenue sur score"),

              AppPrimaryButton(
                label: '♠ Nouvelle partie',
                onPressed: () => _navigateTo(context, const NewGameScreen()),
              ),

              const SizedBox(height: 12),
              AppSecondaryButton(
                label: 'Historique',
                onPressed: () => _navigateTo(context, const HistoryScreen()),
              ),
              const SizedBox(height: 12),
              AppGhostButton(
                label: 'Paramètres',
                onPressed: () => _navigateTo(context, const SettingsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
