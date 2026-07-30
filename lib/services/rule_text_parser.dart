class ParsedRulePart {
  final String text;
  final bool isTerm;

  const ParsedRulePart({required this.text, this.isTerm = false});
}

//recoit un text du paragraphe et retourne un tableau de ParsedRulePart
//afin de faciliter l'affichage
List<ParsedRulePart> parseRuleText(String text) {
  final parts = <ParsedRulePart>[];
  final markerPattern = RegExp(r'\{\{(.+?)\}\}');

  int cursor = 0;

  for (final match in markerPattern.allMatches(text)) {
    // Texte avant le terme
    if (match.start > cursor) {
      parts.add(ParsedRulePart(text: text.substring(cursor, match.start)));
    }

    // Terme trouvé
    parts.add(ParsedRulePart(text: match.group(1)!, isTerm: true));

    cursor = match.end;
  }

  // Texte restant après le dernier terme
  if (cursor < text.length) {
    parts.add(ParsedRulePart(text: text.substring(cursor)));
  }

  return parts;
}
