import 'package:flutter/material.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/topbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: const AppTopBar(title: 'À propos'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 22, 24, 28),
        children: [
          // _Header(),
          // const SizedBox(height: 4),
          _Paragraph(
            'Pour compter le score à la Belote, il y a deux catégories de '
            'joueurs.',
            lead: true,
          ),
          _Paragraph(
            "Il y a ceux qui arrivent à tout retenir de tête. Souvent, ce "
            "sont les vétérans, ceux qui jouent depuis longtemps, ou "
            "simplement ceux qui ont une bonne mémoire pour les chiffres. "
            "Ils savent combien leur équipe a, combien l'autre a, sans "
            "avoir besoin de noter quoi que ce soit.",
          ),
          _Paragraph('Et puis il y a les autres.'),
          _Paragraph('Moi, je fais partie des autres. 😅', lead: true),

          const _SuitDivider(),

          Text.rich(
            TextSpan(
              style: AppTextStyles.body.copyWith(
                fontSize: 13,
                height: 1.65,
                color: AppColors.brown,
              ),
              children: [
                const TextSpan(
                  text:
                      "Au fil du temps, j'ai essayé différentes façons de faire. "
                      "D'abord, essayer de retenir les scores ou de les noter "
                      "quelque part. Puis on a commencé à utiliser le téléphone. "
                      "Dans les notes, on écrivait simplement quelque chose "
                      "comme ",
                ),
                _CodeChipSpan('32 × 42'),
                const TextSpan(
                  text:
                      " : 32 pour notre équipe et 42 pour l'autre. Après chaque "
                      "manche, on faisait le calcul pour obtenir le nouveau "
                      "score, puis on remplaçait les anciens chiffres. Par "
                      "exemple, ",
                ),
                _CodeChipSpan('64 × 42'),
                const TextSpan(text: ', et ainsi de suite.'),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),

          _Paragraph(
            'Plus tard, les calculatrices ont pris le relais. Chaque équipe '
            'avait la sienne et ajoutait ses points après chaque manche. '
            "C'était déjà mieux : on n'avait plus besoin de tout garder en "
            'tête et on pouvait retrouver les scores précédents.',
          ),
          _Paragraph(
            "Et puis je me suis dit : pourquoi ne pas créer une application "
            "pour nous aider, nous, la deuxième catégorie de joueurs ? 😅",
            lead: true,
          ),
          Text.rich(
            TextSpan(
              style: AppTextStyles.body.copyWith(
                fontSize: 13,
                height: 1.65,
                color: AppColors.brown,
              ),
              children: [
                const TextSpan(text: "C'est comme ça qu'est née l'idée de "),
                TextSpan(
                  text: 'Score?',
                  style: AppTextStyles.bodyBold.copyWith(fontSize: 13),
                ),
                const TextSpan(
                  text:
                      ' : une petite application pour noter les scores, garder '
                      'une trace de la partie et laisser les calculs de côté.',
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          _Paragraph('Parce que au fond, on est surtout là pour jouer.'),

          const SizedBox(height: 6),
          const _SloganQuote(),
          const SizedBox(height: 12),
          Text(
            'Fait avec ♥ par une joueuse de la 2ᵉ catégorie.',
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              fontSize: 12,
              color: AppColors.wine.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '© 2026 Score? — Tous droits réservés',
            textAlign: TextAlign.center,
            style: AppTextStyles.button.copyWith(
              fontSize: 10.5,
              color: AppColors.wine.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [AppColors.wineLight, AppColors.wineDeep],
              center: Alignment(-0.3, -0.4),
            ),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.gold, width: 3),
            ),
          ),
          child: const Text('🤔', style: TextStyle(fontSize: 32)),
        ),
        const SizedBox(height: 8),
        Text('À propos', style: AppTextStyles.appTitle.copyWith(fontSize: 22)),
        const SizedBox(height: 14),
      ],
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;
  final bool lead;
  const _Paragraph(this.text, {this.lead = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: lead
            ? AppTextStyles.bodyBold.copyWith(
                fontSize: 14.5,
                height: 1.5,
                color: AppColors.wineDeep,
              )
            : AppTextStyles.body.copyWith(
                fontSize: 13,
                height: 1.65,
                color: AppColors.brown,
              ),
      ),
    );
  }
}

/// Le petit chip monospace façon "note de téléphone" pour `32 × 42`.
class _CodeChipSpan extends WidgetSpan {
  _CodeChipSpan(String text)
    : super(
        alignment: PlaceholderAlignment.middle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
          decoration: BoxDecoration(
            color: AppColors.cream2,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.brown, width: 1.5),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
              color: AppColors.wineDeep,
            ),
          ),
        ),
      );
}

/// Séparateur ♠ ♥ ♦ ♣ entre l'intro et le récit.
class _SuitDivider extends StatelessWidget {
  const _SuitDivider();

  @override
  Widget build(BuildContext context) {
    final lineColor = AppColors.brown.withValues(alpha: 0.12);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(child: Container(height: 2, color: lineColor)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '♠ ♥ ♦ ♣',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.goldDeep.withValues(alpha: 0.65),
              ),
            ),
          ),
          Expanded(child: Container(height: 2, color: lineColor)),
        ],
      ),
    );
  }
}

/// Encart doré final avec le slogan de l'app.
class _SloganQuote extends StatelessWidget {
  const _SloganQuote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold, width: 2.5),
      ),
      child: Text.rich(
        TextSpan(
          style: AppTextStyles.appTitle.copyWith(fontSize: 19, height: 1.28),
          children: [
            const TextSpan(text: 'Fini les calculs,\nplace au '),
            TextSpan(
              text: 'jeu',
              style: TextStyle(color: AppColors.goldDeep),
            ),
            const TextSpan(text: ' !'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
