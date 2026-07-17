import 'package:flutter/material.dart';
import 'package:score_belote/screens/history_screen.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/screens/settings_screen.dart';
import 'package:score_belote/widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //declatation des fuctions
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 229, 233),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("bienvenue sur score"),
              MenuButton(
                text: "Nouvelle partie",
                onPressed: () => _navigateTo(context, const NewGameScreen()),
              ),
              MenuButton(
                text: "Historique",
                onPressed: () => _navigateTo(context, const HistoryScreen()),
              ),
              MenuButton(
                text: "Paramètres",
                onPressed: () => _navigateTo(context, const SettingsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
