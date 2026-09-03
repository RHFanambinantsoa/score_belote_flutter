import 'package:flutter/widgets.dart';
import 'package:score_belote/constants/score_strings.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import '../../theme/app_colors.dart';

class RoundsTitleSection extends StatelessWidget {
  final Game game;
  final void Function(TeamType team) addFromTeam;
  const RoundsTitleSection({
    super.key,
    required this.game,
    required this.addFromTeam,
  });
  @override
  Widget build(BuildContext context) {
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
                    ScoreStrings.game,
                    style: AppTextStyles.sectionLabel.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              _verticalLine(),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () => addFromTeam(TeamType.teamA),
                  child: Center(
                    child: Text(
                      game.teamA.label,
                      style: AppTextStyles.sectionLabel.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),

              _verticalLine(),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () => addFromTeam(TeamType.teamB),
                  child: Center(
                    child: Text(
                      game.teamB.label,
                      style: AppTextStyles.sectionLabel.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
          height: 35,
          color: AppColors.brown.withValues(alpha: 0.15),
        ),
      ),
    );
  }

  Widget _horizontalLine() {
    return Container(
      height: 3,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.wineDeep.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
