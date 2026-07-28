import 'package:flutter/material.dart';
import 'package:score_belote/widgets/rule_accordeon_section.dart';
import 'package:score_belote/widgets/topbar.dart';
import '../theme/app_colors.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: const AppTopBar(title: 'Règles du jeu'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
        children: [
          RuleAccordionSection(
            number: '1.',
            title: 'Présentation du jeu',
            initiallyOpen: true,
            child: const RuleParagraph(
              'La Belote Gasy est une variante de la belote classique. Elle reprend les '
              'principes généraux : choisir un type de jeu, jouer des plis, compter les '
              'points et atteindre un objectif pour gagner la partie.',
            ),
          ),
        ],
      ),
    );
  }
}
