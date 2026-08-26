import 'package:flutter/material.dart';
import 'package:score_belote/constants/app_strings.dart';
import 'package:score_belote/constants/score_contants.dart';
import 'package:score_belote/enums/game_variant.dart';
import 'package:score_belote/enums/team_type.dart';
import 'package:score_belote/routes/app_routes.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/theme/app_colors.dart';
import 'package:score_belote/theme/app_text_styles.dart';
import 'package:score_belote/widgets/base/buttons.dart';
import 'package:score_belote/models/game.dart';
import 'package:score_belote/models/team.dart';
import 'package:score_belote/widgets/team_input.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/services/settings_service.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final _teamAController = TextEditingController(
    text: AppStrings.defaultTeamAName,
  );
  final _teamBController = TextEditingController(
    text: AppStrings.defaultTeamBName,
  );
  //textEditingController est un widget qui permet de récupérer la valeur d'un TextField
  @override
  void initState() {
    super.initState();

    _teamAController.addListener(_onTextChanged);
    _teamBController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _teamAController.removeListener(_onTextChanged);
    _teamBController.removeListener(_onTextChanged);

    _teamAController.dispose();
    _teamBController.dispose();
    super.dispose();
  }

  String get _a => _teamAController.text.trim();
  String get _b => _teamBController.text.trim();

  bool get _aEmpty => _a.isEmpty;
  bool get _bEmpty => _b.isEmpty;
  bool get _duplicate =>
      !_aEmpty && !_bEmpty && _a.toLowerCase() == _b.toLowerCase();

  bool get _isValid => !_aEmpty && !_bEmpty && !_duplicate;

  void _validateTeams() {
    Game newGame = Game.create(
      teamA: Team(teamType: TeamType.teamA, label: _a),
      teamB: Team(teamType: TeamType.teamB, label: _b),
      targetScore: ScoreConstants.targetScore,
      settings: SettingsService.settings,
    );

    Navigator.pushReplacementNamed(
      context,
      RouteNames.score,
      arguments: ScoreRouteArgs(game: newGame),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: AppStrings.newGame),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Center(
              child: Text(AppStrings.teams, style: AppTextStyles.appTitle),
            ),
            const SizedBox(height: 40),

            Text(AppStrings.teamA, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 12),
            TeamNameField(
              controller: _teamAController,
              suit: GameVariant.diamonds.abbreviation,
            ),
            SizedBox(
              height: 24,
              child: _aEmpty ? _warning(ErrorMessages.emptyTeamField) : null,
            ),

            const SizedBox(height: 12),
            Center(
              child: Text(
                AppStrings.versus,
                style: AppTextStyles.sectionLabel.copyWith(
                  color: AppColors.goldDeep,
                  fontWeight: FontWeight(800),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(AppStrings.teamB, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 12),
            TeamNameField(
              controller: _teamBController,
              suit: GameVariant.spades.abbreviation,
            ),
            SizedBox(
              height: 24,
              child: _bEmpty
                  ? _warning(ErrorMessages.emptyTeamField)
                  : _duplicate
                  ? _warning(ErrorMessages.duplicateTeamsNames)
                  : null,
            ),
            const SizedBox(height: 40),

            AppPrimaryButton(
              label: AppStrings.play,
              onPressed: _isValid ? _validateTeams : null,
            ),
            //comme ngIf en Angular,
          ],
        ),
      ),
    );
  }

  Widget _warning(String text) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Row(
      children: [
        const Text(
          '⚠ ',
          style: TextStyle(color: AppColors.red, fontWeight: FontWeight.w800),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(
              color: AppColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
