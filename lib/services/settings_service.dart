import 'package:score_belote/models/game_settings.dart';

class SettingsService {
  static final GameSettings _settings = GameSettings();

  static GameSettings get settings => _settings;

  static void update(void Function(GameSettings) change) {
    //fonction qui prend en paramètre une fonction qui prend en paramètre un GameSettings et ne retourne rien
    change(settings);
    save();
  }

  static void save() {
    // rien
  }
}

/**
 * Avec static :

class SettingsService {
  static GameSettings settings = GameSettings();
}

La variable appartient à la classe elle-même, pas à un objet.

Donc tu n'as pas besoin de faire :

final service = SettingsService();
service.settings;

Tu fais directement :

SettingsService.settings;

Il n'existe qu'un seul GameSettings dans toute l'application.

C'est pratique pour des paramètres globaux.
 */
