import 'package:flutter/material.dart';
import 'package:score_belote/models/game.dart';

class ScoreScreen extends StatelessWidget {
  final Game game;

  const ScoreScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score de la partie')),
      body: Center(child: Text("${game.teamA} vs ${game.teamB}")),
    );
  }
}
