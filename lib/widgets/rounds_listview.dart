import 'package:flutter/widgets.dart';
import 'package:score_belote/models/round.dart';
import 'package:score_belote/services/round_name_parser.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

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
                    shortRoundResume(
                      round.gameVariant,
                      round.roundStatus,
                      round.isCapot,
                      round.isDedans,
                    ),
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
