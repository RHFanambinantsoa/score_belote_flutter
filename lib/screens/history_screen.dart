import 'package:flutter/material.dart';
import 'package:score_belote/widgets/topbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'Historique'),
      body: const Center(
        child: Text('Aucune partie enregistrée pour le moment.'),
      ),
    );
  }
}
