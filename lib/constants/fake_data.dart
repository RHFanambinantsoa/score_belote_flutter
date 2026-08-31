import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/models/team.dart';

class FakeDatas {
  FakeDatas._();

  static final List<Game> games = [
    _abandonedGame(
      teamA: 'Les As',
      teamB: 'Les Rois',
      startedAt: DateTime.now().subtract(const Duration(hours: 1)),
      duration: const Duration(minutes: 15),
    ),

    _abandonedGame(
      teamA: 'Rouge',
      teamB: 'Jaune',
      startedAt: DateTime.now().subtract(const Duration(hours: 3)),
      duration: const Duration(minutes: 25),
    ),

    _abandonedGame(
      teamA: 'Tsika',
      teamB: 'Zareo',
      startedAt: DateTime.now().subtract(const Duration(hours: 5)),
      duration: const Duration(minutes: 42),
    ),

    // Hier
    _abandonedGame(
      teamA: 'Les As',
      teamB: 'Les Rois',
      startedAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      duration: const Duration(minutes: 30),
    ),

    _abandonedGame(
      teamA: 'Rouge',
      teamB: 'Bleu',
      startedAt: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      duration: const Duration(minutes: 18),
    ),

    // Il y a 2 jours
    _abandonedGame(
      teamA: 'Tsika',
      teamB: 'Zareo',
      startedAt: DateTime.now().subtract(const Duration(days: 2)),
      duration: const Duration(minutes: 35),
    ),

    _abandonedGame(
      teamA: 'Les As',
      teamB: 'Les Rois',
      startedAt: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
      duration: const Duration(minutes: 50),
    ),

    // Il y a 3 jours
    _abandonedGame(
      teamA: 'Rouge',
      teamB: 'Jaune',
      startedAt: DateTime.now().subtract(const Duration(days: 3)),
      duration: const Duration(hours: 1, minutes: 5),
    ),

    _abandonedGame(
      teamA: 'Rouge',
      teamB: 'Jaune',
      startedAt: DateTime(2025, 8, 8, 16, 30),
      duration: const Duration(hours: 1, minutes: 5),
    ),
  ];

  static Game _abandonedGame({
    required String teamA,
    required String teamB,
    required DateTime startedAt,
    required Duration duration,
  }) {
    final game = Game.create(
      teamA: Team(teamType: TeamType.teamA, label: teamA),
      teamB: Team(teamType: TeamType.teamB, label: teamB),
      settings: GameSettings(),
    );

    game.startedAt = startedAt;
    game.status = GameStatus.abandoned;
    game.endedAt = startedAt.add(duration);

    return game;
  }
}
