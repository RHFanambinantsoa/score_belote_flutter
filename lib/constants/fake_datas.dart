import 'package:score_belote/widgets/history_card.dart';

class FakeDatas {
  FakeDatas._();
  static const List<GameHistoryItem> fakeItems = [
    GameHistoryItem(
      dateLabel: "Ajourdui",
      time: "14:15",
      teamAName: "teamAName",
      teamBName: "teamBName",
      scoreA: 25,
      scoreB: 160,
      capotWinGameName: "",
    ),
    GameHistoryItem(
      dateLabel: "Ajourdui",
      time: "14:15",
      teamAName: "teamAName",
      teamBName: "teamBName",
      scoreA: 25,
      scoreB: 60,
      capotWinGameName: "Couleur ♣",
    ),
    GameHistoryItem(
      dateLabel: "Ajourdui",
      time: "14:15",
      teamAName: "teamAName",
      teamBName: "teamBName",
      scoreA: 25,
      scoreB: 60,
      capotWinGameName: "TA Dedans",
    ),
    GameHistoryItem(
      dateLabel: "Hier",
      time: "14:15",
      teamAName: "teamAName",
      teamBName: "teamBName",
      scoreA: 25,
      scoreB: 60,
      capotWinGameName: "",
    ),
  ];
}
