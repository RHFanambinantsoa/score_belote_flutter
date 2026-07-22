import 'package:flutter/material.dart';
import 'package:score_belote/widgets/topbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'Paramètres'),
      body: const Center(
        child: Text('Aucun paramètre disponible pour le moment.'),
      ),
    );
  }
}
