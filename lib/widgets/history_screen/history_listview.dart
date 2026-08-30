import 'package:flutter/widgets.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/widgets/history_screen/grouped_date_label.dart';
import 'package:score_belote/widgets/history_screen/history_card.dart';

class HistoryListview extends StatelessWidget {
  final List<Game> games;
  final void Function(Game game) onDeleteCard;
  final void Function(Game game) onTapCard;
  const HistoryListview({
    super.key,
    required this.games,
    required this.onDeleteCard,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
      itemCount: games.length,
      itemBuilder: (context, i) {
        final game = games[i];
        final showDateLabel =
            i == 0 || games[i - 1].createdDateLabel != game.createdDateLabel;
        //regroupe les même dates

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDateLabel)
              GroupedDateLabel(text: game.createdDateLabel.toUpperCase()),
            HistoryCard(
              game: game,
              onDelete: () => onDeleteCard(game),
              onTap: () => onTapCard(game),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
