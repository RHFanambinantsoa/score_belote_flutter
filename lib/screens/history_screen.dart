import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des parties'),
      ),
      body: const Center(
        child: Text('Aucune partie enregistrée pour le moment.'),
      ),
    );
  }
}