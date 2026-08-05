enum RoundStatus {
  normal("Normal", 1),
  doubled("Contré", 2),
  redoubled("Surcontré", 4);

  final String label;
  final int multiplifier;
  const RoundStatus(this.label, this.multiplifier);

  static List<RoundStatus> get withoutRedoubled =>
      values.sublist(0, values.length - 1);
}
