import 'package:score_belote/enums/option_types.dart';

class RedoubleOption {
  final RedoubleType type;
  final String label;
  bool enabled;

  RedoubleOption({
    required this.type,
    required this.label,
    required this.enabled,
  });
}
