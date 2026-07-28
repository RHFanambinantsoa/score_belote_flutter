import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Une section repliable de l'écran "Règles du jeu". `number` affiche le
/// numéro de section en doré devant le titre (ex: "7."). Passe
/// `initiallyOpen: true` pour les sections à montrer ouvertes par défaut.
class RuleAccordionSection extends StatefulWidget {
  final String number;
  final String title;
  final bool initiallyOpen;
  final Widget child;

  const RuleAccordionSection({
    super.key,
    required this.number,
    required this.title,
    required this.child,
    this.initiallyOpen = false,
  });

  @override
  State<RuleAccordionSection> createState() => _RuleAccordionSectionState();
}

class _RuleAccordionSectionState extends State<RuleAccordionSection> {
  late bool _open = widget.initiallyOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.brown.withValues(alpha: 0.15),
          width: 2,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      //clip empêche de contenu de déborder comme overflow: hidden;
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _open = !_open),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              child: Row(
                children: [
                  Text(
                    '${widget.number} ',
                    style: AppTextStyles.button.copyWith(
                      fontSize: 12,
                      color: AppColors.goldDeep,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTextStyles.button.copyWith(fontSize: 14),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _open ? 0.25 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: const Icon(
                      Icons.chevron_right,
                      color: AppColors.wine,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 180),
            crossFadeState: _open
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
              child: widget.child,
            ),
            secondChild: const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

/// Paragraphe standard à l'intérieur d'une section.
class RuleParagraph extends StatelessWidget {
  final String text;
  const RuleParagraph(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: AppTextStyles.body.copyWith(fontSize: 12.5, height: 1.55),
  );
}

/// Encart d'exemple, fond crème avec liseré doré à gauche.
class RuleExample extends StatelessWidget {
  final String text;
  const RuleExample(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(8),
        border: const Border(left: BorderSide(color: AppColors.gold, width: 3)),
      ),
      child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 12)),
    );
  }
}
