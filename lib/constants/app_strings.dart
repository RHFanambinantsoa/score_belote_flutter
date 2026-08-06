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
  static const String defaultTeamAName = "Tsika";
  static const String defaultTeamBName = "Zareo";

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

  static const String warningEmoji = "⚠️";
  static const String thinkingEmoji = "🤔";
  static const String binEmoji = '🗑️';
  static const String versusEmoji = '🆚';
  static const String trophyEmoji = '🏆';
  static const String cardEmoji = '🃏';

  static const String clubsSymbol = '♣';
  static const String diamondsSymbol = '♦';
  static const String heartsSymbol = '♥';
  static const String spadesSymbol = '♠';
  static const String allTrumpAbbreviation = "TA";
  static const String noTrumpAbbreviation = "SA";
  static const String doubledAbbreviation = "x2";
  static const String redoubledAbbreviation = "x4";
  static const String dedansAbbreviation = "D";
  static const String capotAbbreviation = "Cap.";

  //setting screen
  static const String gameOptions = "Options du jeu";
  static const String allowSplitScore = "Autoriser le partage du score (TA)";
  static const String allowClubsRedoubleScore = "Autoriser le Trèfle Surcontré";
  static const String allowNoTrumpRedoubleScore =
      "Autoriser le SansA Surcontré";
  static const String endGameRoundsLabel = "Fin de la partie";
  static const String allTrumpCapotDedansEndGame = "Capot Dedans ToutA";
  static const String data = "Données";
  static const String deleteHistory = "Effacer l'historique";
  static const String reset = 'Réinitialiser';
  static const String gameRules = "Règles du jeu";

  //modals
  static const String deleteHistoryModalTitle = "Supprimer l'historique ?";
  static const String deleteHistoryModalMessage =
      'Toutes les parties enregistrées seront définitivement supprimées. '
      'Cette action est irréversible.';
  static const String delete = 'Supprimer';
  static const String victory = 'Victoire !';
  static const String winGame = 'remporte la partie';

  //history
  static const String emptyHistoryMessage =
      "Aucune partie jouée pour l'instant.\nLancez votre première partie depuis le menu !";

  //history modal
  static const String classicVictory = "🎉 Victoire classique";
  static const String capotVictory = "🔥 Victoire par Capot 👉 ";
}

class ErrorMessages {
  ErrorMessages._();

  static const String duplicateTeamsNames =
      "Les deux équipes doivent avoir un nom différent";
  static const String emptyTeamField =
      "Le nom de l'équipe ne peut pas être vide";
}

class BeloteRule {
  BeloteRule._();
}
