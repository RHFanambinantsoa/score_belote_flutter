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
      "Autoriser le Sans Atout Surcontré";
  static const String endGameRoundsLabel = "Fin de la partie";
  static const String allTrumpCapotDedansEndGame = "Tout Atout Capot Dedans";
  static const String data = "Données";
  static const String deleteHistory = "Effacer l'historique";
  static const String reset = 'Réinitialiser';

  //modals
  static const String deleteHistoryModalTitle = "Supprimer l'historique ?";
  static const String deleteHistoryModalMessage =
      'Toutes les parties enregistrées seront définitivement supprimées. '
      'Cette action est irréversible.';
  static const String delete = 'Supprimer';

  //history
  static const String emptyHistoryMessage =
      "Aucune partie jouée pour l'instant.\nLancez votre première partie depuis le menu !";

  //history modal
  static const String classicVictory = "🎉 Victoire classique";
  static const String CapotVictory = "🔥 Victoire par Capot 👉 ";
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

  static const String authorNoteTitle = "Note de l'autrice";
  static const List<String> authorNoteParagraphs = [
    "Dans ce document, j'ai essayé d'expliquer les règles du jeu du mieux possible, en m'appuyant sur mes connaissances et mon expérience de la Belote Gasy.",
    "Malgré le soin apporté à sa rédaction, il est possible que certaines explications soient incomplètes, imprécises ou ne correspondent pas aux règles pratiquées dans toutes les régions ou tous les cercles de joueurs.",
    "Si vous remarquez une erreur, une information à corriger, une règle manquante ou si vous avez des suggestions permettant d'améliorer ce document, je vous serais très reconnaissante de me les faire parvenir.",
    "Toute remarque constructive est la bienvenue et contribuera à rendre cette documentation plus claire, plus complète et plus fidèle aux différentes pratiques du jeu.",
    "Merci pour votre lecture et votre contribution.",
  ];

  static const String gamePresentationTitle = "Présentation du jeu";
  static const List<String> gamePresentationParagraphs = [
    "La Belote Gasy est une variante de la belote classique.",
    "Elle reprend les principes généraux du jeu : choisir un type de jeu, jouer des plis, compter les points et atteindre un objectif afin de remporter la partie.",
    "Cette version possède toutefois certaines règles particulières qui la distinguent de la belote classique.",
  ];
  static const String gamePresentationNote =
      "À noter :   Certaines règles ou pratiques peuvent varier selon les régions ou les groupes de joueurs.";
}
