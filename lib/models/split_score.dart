class SplitScore {
  int callerScore;
  int defenderScore;

  SplitScore({required this.callerScore, required this.defenderScore});

  Map<String, dynamic> toJson() {
    return {"callerScore": callerScore, "defenderScore": defenderScore};
  }
}
