import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/routes/app_routes.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/services/history_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/widgets/base/snack_bar.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/history_screen/empty_history.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/filter_sheet.dart';
import 'package:score_belote/widgets/history_screen/history_listview.dart';
import 'package:score_belote/widgets/modals/confirm_modal.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final games = HistoryService.games;
  final TextEditingController _teamController = TextEditingController();
  DateTime? _selectedDate;
  GameResultType? _selectedResultType;
  List<Game> _filteredGames = [];

  @override
  initState() {
    super.initState();
    _filteredGames = games;
  }

  void _clearHistory() {
    HistoryService.clear();
    setState(() {
      _filteredGames = [];
    });
  }

  Future<void> _deleteGame(Game game) async {
    final confirmed = await AppConfirmDialog.show(
      context,
      title: HistoryStrings.deleteGameToHistory,
      message: "",
      confirmLabel: AppStrings.delete,
      isDestructive: true,
      icon: AppStrings.binEmoji,
    );

    if (confirmed != true) {
      return;
    }
    HistoryService.remove(game);
    setState(() {
      _filteredGames.remove(game);
    });
  }

  Future<void> _showFilters() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FilterSheet(
          teamController: _teamController,
          selectedDate: _selectedDate,
          selectedResultType: _selectedResultType,
          onDateChanged: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
          onResultChanged: (result) {
            setState(() {
              _selectedResultType = result;
            });
          },
          onReset: () {
            setState(() {
              _teamController.clear();
              _selectedDate = null;
              _selectedResultType = null;
              _filteredGames = HistoryService.games;
            });

            Navigator.pop(context);
          },
          onApply: () {
            Navigator.pop(context);
            _applyFilters();
            if (_filteredGames.isEmpty) {
              AppSnackBar.show(
                context,
                message: 'Aucun résultat trouvé pour ces filtres.',
              );
            }
          },
        );
      },
    );
  }

  void _applyFilters() {
    final teamQuery = _teamController.text.trim().toLowerCase();

    setState(() {
      _filteredGames = HistoryService.games.where((game) {
        final matchesTeam =
            teamQuery.isEmpty ||
            game.teamA.label.toLowerCase().contains(teamQuery) ||
            game.teamB.label.toLowerCase().contains(teamQuery);

        final matchesDate =
            _selectedDate == null ||
            (game.startedAt.year == _selectedDate!.year &&
                game.startedAt.month == _selectedDate!.month &&
                game.startedAt.day == _selectedDate!.day);

        final matchesResult =
            _selectedResultType == null ||
            game.gameResultType == _selectedResultType;

        return matchesTeam && matchesDate && matchesResult;
      }).toList();
    });
  }

  void _goToScoreScreen(Game game) {
    Navigator.pushNamed(
      context,
      RouteNames.score,
      arguments: ScoreRouteArgs(game: game, viewMode: true),
    );
  }

  @override
  void dispose() {
    _teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final games = HistoryService.games;
    // final displayedGames = _filteredGames.isEmpty && games.isNotEmpty
    //     ? games
    //     : _filteredGames;
    return Scaffold(
      appBar: AppTopBar(title: AppStrings.history),
      backgroundColor: AppColors.cream,
      body: games.isEmpty
          ? const EmptyHistory()
          : _HistoryList(
              games: _filteredGames,
              onClearHistory: _clearHistory,
              onDeleteCard: _deleteGame,
              onTapCard: _goToScoreScreen,
              onShowFilters: _showFilters,
            ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<Game> games;
  final VoidCallback onClearHistory;
  final void Function(Game game) onDeleteCard;
  final void Function(Game game) onTapCard;
  final VoidCallback onShowFilters;

  const _HistoryList({
    required this.games,
    required this.onClearHistory,
    required this.onDeleteCard,
    required this.onTapCard,
    required this.onShowFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: AppDeleteHistoryButton(onPressed: onClearHistory),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: AppGhostButton(
                  label: HistoryStrings.filter,
                  onPressed: onShowFilters,
                ),
              ),
            ],
          ),

          Container(
            height: 2,
            margin: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.brown.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Expanded(
            child: HistoryListview(
              games: games.reversed.toList(),
              onDeleteCard: onDeleteCard,
              onTapCard: onTapCard,
            ),
          ),
        ],
      ),
    );
  }
}
