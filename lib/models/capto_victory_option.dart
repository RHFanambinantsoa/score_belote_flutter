import 'package:score_belote/enums/option_types.dart';

class CaptoVictoryOption {
  final CapotVictoryType type;
  final String label;
  bool enabled;

  CaptoVictoryOption({
    required this.type,
    required this.label,
    required this.enabled,
  });
}
