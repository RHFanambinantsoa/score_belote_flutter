import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/services/history_service.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/history_screen/empty_history.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/history_listview.dart';

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

  @override
  Widget build(BuildContext context) {
    final games = HistoryService.games;

    return Scaffold(
      appBar: AppTopBar(title: AppStrings.history),
      backgroundColor: AppColors.cream,
      body: games.isEmpty
          ? const EmptyHistory()
          : _HistoryList(games: games, onClearHistory: _clearHistory),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<Game> games;
  final VoidCallback onClearHistory;
  const _HistoryList({required this.games, required this.onClearHistory});

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
          Expanded(child: HistoryListview(games: games.reversed.toList())),
        ],
      ),
    );
  }
}
