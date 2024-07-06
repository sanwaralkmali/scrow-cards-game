import 'dart:math';
import 'package:scrow/data/cardsData.dart';

class Deck {
  final List<CardG> cards = [];

  Deck() {
    // Initialize with 52 regular cards (1-10, 4 of each)
    for (int rank = 1; rank <= 10; rank++) {
      for (int i = 0; i < 4; i++) {
        cards.add(CardG(
            rank: rank,
            isSpecial: false,
            imagePath:
                'assets/cards/$rank.png')); // Update image path to assets folder
      }
    }

    // Initialize with 6 special cards (11-16, 2 of each)
    for (int rank = 11; rank <= 16; rank++) {
      for (int i = 0; i < 2; i++) {
        cards.add(CardG(
            rank: rank, isSpecial: true, imagePath: 'assets/cards/$rank.png'));
      }
    }
  }

  void shuffle() {
    cards.shuffle(Random());
  }

  CardG drawCard() {
    if (cards.isNotEmpty) {
      return cards.removeLast();
    } else {
      throw Exception('Deck is empty');
    }
  }
}
