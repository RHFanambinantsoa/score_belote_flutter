import 'package:flutter/widgets.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/round_status.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

extension GameVariantUIExtension on GameVariant {
  String get symbol => switch (this) {
    GameVariant.clubs => AppStrings.clubsSymbol,
    GameVariant.diamonds => AppStrings.diamondsSymbol,
    GameVariant.hearts => AppStrings.heartsSymbol,
    GameVariant.spades => AppStrings.spadesSymbol,
    GameVariant.noTrump => AppStrings.noTrumpAbbreviation,
    GameVariant.allTrump => AppStrings.allTrumpAbbreviation,
  };

  bool get isRed => this == GameVariant.diamonds || this == GameVariant.hearts;
}

extension RoundStatusUIExtension on RoundStatus {
  String get abbreviation => switch (this) {
    RoundStatus.doubled => AppStrings.doubledAbbreviation,
    RoundStatus.redoubled => AppStrings.redoubledAbbreviation,
    RoundStatus.normal => '',
  };
}

class RoundsListview extends StatelessWidget {
  final List<Round> rounds;
  const RoundsListview({super.key, required this.rounds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rounds.length,
      itemBuilder: (context, index) {
        final round = rounds[index];

        return _row(round);
      },
    );
  }

  String _roundResume(Round round) {
    final gameVariant = round.gameVariant.symbol;

    //à ajouter dans details (split score)
    final details = [
      if (round.roundStatus != RoundStatus.normal)
        round.roundStatus.abbreviation,
      if (round.isCapot) AppStrings.capotAbbreviation,
      if (round.isDedans) AppStrings.dedansAbbreviation,
    ];
    // collection if en dart
    // si la condition est rempli, ajoute dans la collection
    // equivalent à
    // if (round.isCapot) {details.add(AppStrings.capotAbbreviation);}

    if (details.isEmpty) {
      return gameVariant;
    }

    return "$gameVariant | ${details.join(" ")}";
  }

  Widget _row(Round round) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        spacing: 4,
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    _roundResume(round),
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              _verticalLine(),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    round.teamAScore != 0 ? "${round.teamAScore}" : "-",
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              _verticalLine(),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    round.teamBScore != 0 ? "${round.teamBScore}" : "-",
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          _horizontalLine(),
        ],
      ),
    );
  }

  Widget _verticalLine() {
    return SizedBox(
      width: 15,
      child: Center(
        child: Container(
          width: 2,
          height: 26,
          color: AppColors.brown.withValues(alpha: 0.15),
        ),
      ),
    );
  }

  Widget _horizontalLine() {
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.brown.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
