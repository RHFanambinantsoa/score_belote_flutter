enum RoundStatus {
  normal("Normal", 1),
  doubled("Contré", 2),
  redoubled("Surcontré", 4);

  final String label;
  final int multiplifier;
  const RoundStatus(this.label, this.multiplifier);
}
