import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/fake_datas.dart';
import 'package:score_belote/constants/history_strings.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/history_screen/history_card.dart';
import 'package:score_belote/widgets/base/topbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = FakeDatas.fakeItems;
    return Scaffold(
      appBar: AppTopBar(title: AppStrings.history),
      backgroundColor: AppColors.cream,
      body: items.isEmpty ? const _EmptyHistory() : _HistoryList(items: items),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(AppStrings.cardEmoji, style: TextStyle(fontSize: 36)),
            const SizedBox(height: 10),
            Text(
              HistoryStrings.emptyHistoryMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyBold.copyWith(
                color: AppColors.wine.withValues(alpha: 0.7),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<GameHistoryItem> items;
  const _HistoryList({required this.items});

  @override
  Widget build(BuildContext context) {
    // Regroupe les parties consécutives ayant le même dateLabel sous un
    // seul en-tête de section
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        children: [
          AppDeleteHistoryButton(
            onPressed: () => {
              // print(items.length)
            },
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
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                final showDateLabel =
                    i == 0 || items[i - 1].dateLabel != item.dateLabel;
                //regroupe les même dates

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showDateLabel)
                      _groupLabel(item.dateLabel.toUpperCase()),
                    HistoryCard(item: item),
                    const SizedBox(height: 12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _groupLabel(String text) => Padding(
  padding: const EdgeInsets.all(4),
  child: Center(
    child: Text(
      text,
      style: AppTextStyles.sectionLabel.copyWith(fontWeight: FontWeight.w700),
    ),
  ),
);
