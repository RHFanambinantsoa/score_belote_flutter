class SplitScore {
  int callerScore;
  int defenderScore;

  SplitScore({required this.callerScore, required this.defenderScore});

  Map<String, dynamic> toJson() {
    return {"callerScore": callerScore, "defenderScore": defenderScore};
  }

  factory SplitScore.fromJson(Map<String, dynamic> json) {
    //transforme le json en objet
    return SplitScore(
      callerScore: json["callerScore"],
      defenderScore: json["defenderScore"],
    );
  }
}
