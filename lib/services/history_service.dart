import 'package:score_belote/models/game.dart';

class HistoryService {
  static final List<Game> _games = [];

  static List<Game> get games => List.unmodifiable(_games);

  static void add(Game game) {
    _games.add(game);
  }

  static void remove(Game game) {
    _games.remove(game);
  }

  static void clear() {
    _games.clear();
  }
}
