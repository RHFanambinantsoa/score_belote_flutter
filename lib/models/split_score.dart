class SplitScore {
  int callerScore;
  int defenderScore;

  SplitScore({required this.callerScore, required this.defenderScore});

  @override
  bool operator ==(Object other) =>
      other is SplitScore &&
      other.defenderScore == defenderScore &&
      other.callerScore == callerScore;
  //On dit à Dart : Deux SplitScore sont égaux si leurs valeurs sont les mêmes.

  @override
  int get hashCode => Object.hash(callerScore, defenderScore);
  // hashCode est utilisé par les collections comme : Set/ Map/ contains()
  /**
   * Pour chercher rapidement, Dart ne compare pas tous les objets un par un.
   * Il utilise le hash.
    Donc si deux objets sont égaux :
    a == b
    ils doivent obligatoirement avoir :
    a.hashCode == b.hashCode
   */
}
