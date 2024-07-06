import 'package:flutter/material.dart';
import 'package:scrow/data/cardsData.dart';
import 'package:scrow/data/deck.dart';
import 'package:scrow/data/player.dart';

class GameState extends ChangeNotifier {
  bool initialTimeElapsed = false;
  final Deck deck = Deck();
  List<CardG> discardPile = [];
  List<Player> players = [];

  GameState() {
    // Start the timer
    initialTimeElapsed = true;
    Future.delayed(Duration(seconds: 3), () {
      initialTimeElapsed = false;
      notifyListeners();
    });
  }

  void initializeGame() {
    deck.shuffle();

    players = [
      Player(name: 'Player 1'),
      Player(name: 'Player 2'),
      Player(name: 'Player 3'),
      Player(name: 'Player 4'),
    ];
    discardPile.add(deck.drawCard());

    // Deal cards to players
    for (int i = 0; i < 4; i++) {
      for (Player player in players) {
        player.addCardToHand(deck.drawCard());
      }
    }
    notifyListeners();
  }

  //Add the card that was drawn to the player hand
  void drawFromDeck() {
    if (deck.cards.isNotEmpty) {
      final card = deck.drawCard();
      final currentPlayer = players[0];
      currentPlayer.addCardToHand(card);
      notifyListeners();
    }
  }

  // ... (Other game logic methods for discarding, swapping, etc.)
}
