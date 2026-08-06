import 'package:flutter/material.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';

class RoundResumeSection extends StatelessWidget {
  final String roundNameResume;
  final String capotStatus;
  final bool isSplit;
  final List<Team> teams;
  final int teamAScore;
  final int teamBScore;

  const RoundResumeSection({
    super.key,
    required this.roundNameResume,
    required this.isSplit,
    required this.teams,
    required this.teamAScore,
    required this.teamBScore,
    required this.capotStatus,
  });

  String _winnerName() =>
      (teamAScore == 0 || teamBScore == 0) && teamAScore > teamBScore
      ? teams[0].label
      : teams[1].label;

  int _winnerScore() => teamAScore > teamBScore ? teamAScore : teamBScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          spacing: 4,
          children: [
            if (capotStatus != "")
              Text(
                capotStatus,
                style: AppTextStyles.sectionLabel.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.brown,
                ),
              ),
            Text(
              isSplit ? "ToutA Mizara" : roundNameResume,
              style: AppTextStyles.sectionLabel.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.brown,
              ),
            ),

            if (!isSplit)
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Pour  ',
                          style: AppTextStyles.sectionLabel.copyWith(
                            fontSize: 18,
                            color: AppColors.brown,
                          ),
                        ),
                        TextSpan(
                          text: _winnerName(),
                          style: AppTextStyles.sectionLabel.copyWith(
                            fontSize: 20,
                            color: AppColors.goldDeep,
                          ),
                        ),
                        TextSpan(
                          text: ' ? ',
                          style: AppTextStyles.sectionLabel.copyWith(
                            fontSize: 18,
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "+ ${_winnerScore()}",
                          style: AppTextStyles.bigScore.copyWith(
                            fontSize: 28,
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (isSplit)
              Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      //depend de la longueur du contenu
                      1: IntrinsicColumnWidth(),
                    },
                    children: teams.map((team) {
                      return TableRow(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 120),
                            child: Text(
                              team.label,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.sectionLabel.copyWith(
                                fontSize: 18,
                                color: AppColors.brown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              "+ ${team.teamType == TeamType.teamA ? teamAScore : teamBScore}",
                              textAlign: TextAlign.left,
                              style: AppTextStyles.bigScore.copyWith(
                                fontSize: 24,
                                color: AppColors.brown,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
