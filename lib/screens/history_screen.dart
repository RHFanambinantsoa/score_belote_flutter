import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/enums/game_status.dart';
import 'package:score_belote/models/filter_fields.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/routes/app_routes.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/services/history_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/history_screen/empty_history.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/filter_button.dart';
import 'package:score_belote/widgets/history_screen/filter_sheet.dart';
import 'package:score_belote/widgets/history_screen/history_listview.dart';
import 'package:score_belote/widgets/modals/confirm_modal.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _teamFilter = '';
  DateTime? _dateFilter;
  GameResultType? _resultFilter;

  List<Game> _filteredGames = [];
  bool _hasActiveFilters = false;

  @override
  initState() {
    super.initState();
    _filteredGames = List.from(HistoryService.games);
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
    final result = await showModalBottomSheet<FilterFields>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FilterSheet(
          initialTeam: _teamFilter,
          initialDate: _dateFilter,
          initialResultType: _resultFilter,
        );
      },
    );

    if (result == null) {
      return;
    }

    setState(() {
      _teamFilter = result.team;
      _dateFilter = result.date;
      _resultFilter = result.resultType;
    });

    _applyFilters();
  }

  void _applyFilters() {
    final teamQuery = _teamFilter.trim().toLowerCase();

    final hasFilters =
        teamQuery.isNotEmpty || _dateFilter != null || _resultFilter != null;

    if (!hasFilters) {
      setState(() {
        _hasActiveFilters = false;
        _filteredGames = List.from(HistoryService.games);
      });

      return;
    }

    final filtered = HistoryService.games.where((game) {
      final matchesTeam =
          teamQuery.isEmpty ||
          game.teamA.label.toLowerCase().contains(teamQuery) ||
          game.teamB.label.toLowerCase().contains(teamQuery);

      final matchesDate =
          _dateFilter == null ||
          (game.startedAt.year == _dateFilter!.year &&
              game.startedAt.month == _dateFilter!.month &&
              game.startedAt.day == _dateFilter!.day);

      final matchesResult =
          _resultFilter == null || game.gameResultType == _resultFilter;

      return matchesTeam && matchesDate && matchesResult;
    }).toList();

    setState(() {
      _hasActiveFilters = true;
      _filteredGames = filtered;
    });
  }

  void _goToScoreScreen(Game game) {
    Navigator.pushNamed(
      context,
      RouteNames.score,
      arguments: ScoreRouteArgs(game: game, viewMode: true),
    );
  }

  void _clearFilters() {
    setState(() {
      _teamFilter = '';
      _dateFilter = null;
      _resultFilter = null;
      _hasActiveFilters = false;
      _filteredGames = List.from(HistoryService.games);
    });
  }

  int _countFilters() {
    return (_teamFilter.isNotEmpty ? 1 : 0) +
        (_dateFilter != null ? 1 : 0) +
        (_resultFilter != null ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    final games = HistoryService.games;

    final displayedGames = _hasActiveFilters ? _filteredGames : games;

    return Scaffold(
      appBar: AppTopBar(title: AppStrings.history),
      backgroundColor: AppColors.cream,
      body: games.isEmpty
          ? const EmptyHistory()
          : _HistoryList(
              games: displayedGames,
              hasActiveFilters: _hasActiveFilters,
              activeFilterCount: _countFilters(),
              onClearHistory: _clearHistory,
              onDeleteCard: _deleteGame,
              onTapCard: _goToScoreScreen,
              onShowFilters: _showFilters,
              onClearFilters: _clearFilters,
            ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<Game> games;
  final bool hasActiveFilters;
  final int activeFilterCount;
  final VoidCallback onClearHistory;
  final void Function(Game game) onDeleteCard;
  final void Function(Game game) onTapCard;
  final VoidCallback onShowFilters;
  final VoidCallback onClearFilters;

  const _HistoryList({
    required this.games,
    required this.onClearHistory,
    required this.onDeleteCard,
    required this.onTapCard,
    required this.onShowFilters,
    required this.onClearFilters,
    required this.hasActiveFilters,
    required this.activeFilterCount,
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
                child: FilterButton(
                  hasActiveFilters: hasActiveFilters,
                  onShowFilters: onShowFilters,
                  activeFilterCount: activeFilterCount,
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
            child: hasActiveFilters && games.isEmpty
                ? _noGamesFound()
                : HistoryListview(
                    games: games.reversed.toList(),
                    onDeleteCard: onDeleteCard,
                    onTapCard: onTapCard,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _noGamesFound() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            HistoryStrings.noGameFound,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyBold.copyWith(color: AppColors.wine),
          ),
          const SizedBox(height: 25),
          AppPrimaryButton(
            label: HistoryStrings.allGames,
            onPressed: onClearFilters,
          ),
        ],
      ),
    );
  }
}
