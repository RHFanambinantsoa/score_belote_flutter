import 'package:score_belote/enums/option_types.dart';

class CapotVictoryOption {
  final CapotVictoryType type;
  final String label;
  bool enabled;

  CapotVictoryOption({
    required this.type,
    required this.label,
    required this.enabled,
  });
}
