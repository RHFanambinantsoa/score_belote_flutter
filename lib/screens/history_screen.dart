import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/services/history_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/history_screen/empty_history.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/history_listview.dart';
import 'package:score_belote/widgets/modals/confirm_modal.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void _clearHistory() {
    HistoryService.clear();
    setState(() {});
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final games = HistoryService.games;

    return Scaffold(
      appBar: AppTopBar(title: AppStrings.history),
      backgroundColor: AppColors.cream,
      body: games.isEmpty
          ? const EmptyHistory()
          : _HistoryList(
              games: games,
              onClearHistory: _clearHistory,
              onDeleteCard: _deleteGame,
            ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<Game> games;
  final VoidCallback onClearHistory;
  final void Function(Game game) onDeleteCard;

  const _HistoryList({
    required this.games,
    required this.onClearHistory,
    required this.onDeleteCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        children: [
          AppDeleteHistoryButton(onPressed: onClearHistory),

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
            ),
          ),
        ],
      ),
    );
  }
}
