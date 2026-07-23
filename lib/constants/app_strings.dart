class AppStrings {
  AppStrings._();

  static const String welcomeTitle = "Bienvenue sur SCORE";
  static const String slogan = "Fini les calculs, place au jeu.";

  static const String welcomeDescription =
      "Cette application est née d'une idée simple : "
      "arrêter les débats interminables autour du score pendant les parties de belote.\n\n"
      "Conçue pour rendre vos parties plus simples et agréables, "
      "elle vous permet de suivre le score sans avoir à vous soucier des calculs complexes.";

  static const String startGame = "Commencer";
  static const String play = "Jouer";

  static const String history = "Historique";
  static const String settings = "Paramètres";
  static const String newGame = "Nouvelle partie";
  static const String teams = "Les équipes ...";
  static const String teamInputHint = "Nom de l'équipe";
  static const String teamA = "EQUIPE 1";
  static const String teamB = "EQUIPE 2";
  static const String versus = "◆ CONTRE ◆";
  static const String defaultTeamAName = "Nous";
  static const String defaultTeamBName = "Eux";

  static const String newScore = "Nouveau score";
  static const String splitScoreMode = "Score partagé";
  static const String winner = "GAGNANT";
  static const String caller = "Qui a fait l'appel?";
  static const String game = "Jeu";
  static const String allTrump = "Tout Atout";
  static const String noTrump = "Sans Atout";
  static const String mode = "Mode";
  static const String capot = "Capot";
  static const String dedans = "Dedans";
  static const String splitValues = "Valeur du partage";
  static const String cancel = "Annuler";
  static const String submit = "Valider";

  static const warningEmoji = "⚠️";
  static const thinkingEmoji = "🤔";

  static const clubs = '♣';
  static const diamonds = '♦';
  static const hearts = '♥';
  static const spades = '♠';
}

class ErrorMessages {
  ErrorMessages._();

  static const String duplicateTeamsNames =
      "Les deux équipes doivent avoir un nom différent";
  static const String emptyTeamField =
      "Le nom de l'équipe ne peut pas être vide";
}
