import 'package:flutter/material.dart';
import 'package:score_belote/constants/score_strings.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/add_round/group_label.dart';

class TeamSelector extends StatelessWidget {
  final List<Team> teams;
  final TeamType selectedTeam;
  final ValueChanged<TeamType> onSelected;
  final bool isSplit;

  const TeamSelector({
    super.key,
    required this.teams,
    required this.selectedTeam,
    required this.onSelected,
    required this.isSplit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        if (isSplit)
          GroupLabel(
            label: "${ScoreStrings.game} : ${GameVariant.allTrump.label}",
          ),
        GroupLabel(label: isSplit ? ScoreStrings.caller : ScoreStrings.winner),
        Row(
          spacing: 10,
          children: [
            ...teams.map(
              (team) => Expanded(
                child: _TeamButton(
                  label: team.label,
                  value: team.teamType,
                  selected: selectedTeam == team.teamType,
                  onTap: () => onSelected(team.teamType),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TeamButton extends StatelessWidget {
  final String label;
  final TeamType value;
  final bool selected;
  final VoidCallback onTap;

  const _TeamButton({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.gold : AppColors.cream2,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.brown, width: 2.5),
          boxShadow: selected
              ? [BoxShadow(color: AppColors.goldDeep, offset: Offset(0, 4))]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: AppTextStyles.button.copyWith(
              fontSize: 15,
              color: AppColors.wineDeep,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
