import 'package:scrow/data/cardsData.dart';

class Player {
  final String name;
  final List<CardG> hand = [];

  Player({required this.name});

  void addCardToHand(CardG card) {
    hand.add(card);
  }
}
