import 'package:flutter/material.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/widgets/history_screen/history_card.dart';
import 'package:score_belote/widgets/history_screen/sticky_date_header.dart';

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
    // On regroupe les parties par date.
    final groups = <String, List<Game>>{};
    //On crée une Map. Une Map, c'est une structure : clé → valeur
    /**
     * "Aujourd'hui" → [Game1, Game2]
      "Hier"        → [Game3, Game4]
      "28 Août"     → [Game5]
    */

    for (final game in games) {
      groups.putIfAbsent(
        game.createdDateLabel,
        () => [],
      ); //« Mets cette valeur seulement si la clé n'existe pas encore. »
      groups[game.createdDateLabel]!.add(game);
      //Le ! dit à Dart : « Je sais que cette valeur n'est pas null. »
    }

    return CustomScrollView(
      slivers: [
        for (final group in groups.entries)
          /**
         * Pense à une Map comme à un dictionnaire :
        mot → définition

          .keys → les mots
          .values → les définitions
          .entries → mot + définition ensemble

         */
          SliverMainAxisGroup(
            /**
             * Cela signifie simplement :
              « Ces Slivers appartiennent à la même section. »
             */
            slivers: [
              // Header de la date
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyDateHeader(text: group.key.toUpperCase()),
              ),

              // Parties de cette date
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final game = group.value[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                    child: HistoryCard(
                      game: game,
                      onDelete: () => onDeleteCard(game),
                      onTap: () => onTapCard(game),
                    ),
                  );
                }, childCount: group.value.length),
              ),
            ],
          ),
      ],
    );
  }
}
