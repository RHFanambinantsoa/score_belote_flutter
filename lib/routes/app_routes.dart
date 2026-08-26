import 'package:flutter/material.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/screens/history_screen.dart';
import 'package:score_belote/screens/home_screen.dart';
import 'package:score_belote/screens/new_game_screen.dart';
import 'package:score_belote/screens/rule_screen.dart';
import 'package:score_belote/screens/score_screen.dart';
import 'package:score_belote/screens/settings_screen.dart';
import 'package:score_belote/screens/splash_screen.dart';
import 'package:score_belote/screens/unknown_route_screen.dart';
import 'package:score_belote/screens/welcome_screen.dart';

import 'route_names.dart';

class ScoreRouteArgs {
  final Game game;
  const ScoreRouteArgs({required this.game});
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.newGame:
        return MaterialPageRoute(builder: (_) => const NewGameScreen());

      case RouteNames.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case RouteNames.rules:
        return MaterialPageRoute(builder: (_) => const RuleScreen());

      case RouteNames.history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());

      case RouteNames.score:
        final args = settings.arguments as ScoreRouteArgs;
        return MaterialPageRoute(builder: (_) => ScoreScreen(game: args.game));

      default:
        return MaterialPageRoute(builder: (_) => const UnknownRouteScreen());
    }
  }
}
