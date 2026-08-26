import 'package:flutter/widgets.dart';
import 'package:score_belote/widgets/history_screen/grouped_date_label.dart';
import 'package:score_belote/widgets/history_screen/history_card.dart';

class HistoryListview extends StatelessWidget {
  final List<GameHistoryItem> items;
  const HistoryListview({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              GroupedDateLabel(text: item.dateLabel.toUpperCase()),
            HistoryCard(item: item),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
