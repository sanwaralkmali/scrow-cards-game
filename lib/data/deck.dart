import 'package:scrow/data/cardsData.dart';

class Deck {
  List<Card> cards = [];

  Deck() {
    // Initialize with 52 regular cards (1-10, 4 of each)
    for (int rank = 1; rank <= 10; rank++) {
      for (int i = 0; i < 4; i++) {
        cards.add(Card(
            rank: rank,
            isSpecial: false,
            imagePath:
                '$rank.png')); // Assuming you have images named card_1.png, card_2.png, etc.
      }
    }
    for (int rank = 11; rank <= 16; rank++) {
      for (int i = 0; i < 2; i++) {
        cards.add(Card(
            rank: rank,
            isSpecial: true,
            imagePath:
                '$rank.png')); // Assuming you have images named card_1.png, card_2.png, etc.
      }
    }
  }

  void shuffle() {
    cards.shuffle(); // Use the built-in shuffle method from 'dart:math'
  }

  Card drawCard() {
    if (cards.isNotEmpty) {
      return cards.removeLast(); // Remove the last card (top of the stack)
    } else {
      throw Exception(
          'Deck is empty'); // Handle the case where the deck runs out
    }
  }
}
