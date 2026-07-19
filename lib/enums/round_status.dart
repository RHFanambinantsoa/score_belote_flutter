enum RoundStatus {
  normal("normal", 1),
  doubled("contré", 2),
  redoubled("surcontré", 4);

  final String label;
  final int multiplifier;
  const RoundStatus(this.label, this.multiplifier);
}
