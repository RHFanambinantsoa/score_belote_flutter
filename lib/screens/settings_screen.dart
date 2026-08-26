import 'package:flutter/material.dart';
import 'package:score_belote/constants/settings_strings.dart';
import 'package:score_belote/models/game_settings.dart';
import 'package:score_belote/routes/route_names.dart';
import 'package:score_belote/services/settings_service.dart';
import 'package:score_belote/widgets/add_round/group_label.dart';
import 'package:score_belote/widgets/base/topbar.dart';
import 'package:score_belote/widgets/history_screen/delete_history_button.dart';
import 'package:score_belote/widgets/setting_screen/capot_victory_section.dart';
import 'package:score_belote/widgets/setting_screen/navigation_button.dart';
import 'package:score_belote/widgets/setting_screen/redouble_section.dart';
import 'package:score_belote/widgets/setting_screen/score_split_selector.dart';
import 'package:score_belote/widgets/setting_screen/split_section.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

void _doSomething() {
  // print("reinitialiser ");
}

class SettingsScreenState extends State<SettingsScreen> {
  late GameSettings settings;

  @override
  void initState() {
    super.initState();
    settings = SettingsService.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'Paramètres'),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              children: [
                SizedBox(height: 20),
                Center(
                  child: GroupLabel(
                    label: SettingsStrings.gameOptions.toUpperCase(),
                  ),
                ),

                //autorisé le split
                SplitSection(
                  settings: settings,
                  onChanged: () => setState(() {}),
                ),

                //selection de valeur de split
                if (settings.allowSplit)
                  ScoreSplitSelector(
                    settings: settings,
                    onChanged: () => setState(() {}),
                  ),

                //surcontré autorisé
                RedoubleSection(
                  settings: settings,
                  onChanged: () => setState(() {}),
                ),
                SizedBox(height: 15),

                //victoire par capot
                CapotVictorySection(
                  settings: settings,
                  onChanged: () => setState(() {}),
                ),
                SizedBox(height: 15),

                //supprimer l'historique
                Center(
                  child: GroupLabel(label: SettingsStrings.data.toUpperCase()),
                ),
                AppDeleteHistoryButton(onPressed: _doSomething),
                SizedBox(height: 15),

                //règle de jeu
                Center(
                  child: GroupLabel(label: SettingsStrings.info.toUpperCase()),
                ),
                NavigationButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteNames.rules),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
