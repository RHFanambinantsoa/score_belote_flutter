/// Un bloc de contenu à l'intérieur d'une section de règles.
/// Types disponibles : [RuleSubtitle], [RuleParagraph], [RuleExample],
/// [RuleTableBlock]. Un paragraphe peut contenir des termes cliquables en
/// les entourant de doubles accolades, ex: "des {{atout}} plus forts" —
///
sealed class RuleBlock {
  const RuleBlock();
}

/// Sous-titre à l'intérieur d'une section (ex: "Ordre des appels").
class RuleSubtitle extends RuleBlock {
  final String text;
  const RuleSubtitle(this.text);
}

/// Paragraphe de texte normal. Peut contenir des marqueurs `{{terme}}`
/// qui seront rendus comme des termes cliquables (voir [ruleGlossary]).
class RuleParagraph extends RuleBlock {
  final String text;
  const RuleParagraph(this.text);
}

/// Encart d'exemple concret (fond crème, liseré doré).
class RuleExample extends RuleBlock {
  final String text;
  const RuleExample(this.text);
}

/// Une ligne libellé/valeur dans un tableau de référence.
class RuleRow {
  final String label;
  final String value;
  const RuleRow(this.label, this.value);
}

/// Un tableau de référence (score normal, multiplicateurs, etc.).
class RuleTableBlock extends RuleBlock {
  final String? heading;
  final List<RuleRow> rows;
  const RuleTableBlock({this.heading, required this.rows});
}

/// Une section numérotée de l'écran des règles (ex: "7. L'appel et le
/// choix du jeu"), affichée comme un élément d'accordéon.
class RuleSection {
  final String number;
  final String title;
  final List<RuleBlock> blocks;
  final bool initiallyOpen;

  const RuleSection({
    required this.number,
    required this.title,
    required this.blocks,
    this.initiallyOpen = false,
  });
}

/// La définition d'un terme du glossaire (ex: "atout", "cartes
/// françaises"), affichée en bottom sheet quand on tape sur le terme.
class RuleGlossaryTerm {
  final String title;
  final String icon;
  final List<RuleBlock> body;
  const RuleGlossaryTerm({
    required this.title,
    this.icon = '📖',
    required this.body,
  });
}
