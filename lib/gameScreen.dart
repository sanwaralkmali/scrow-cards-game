// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrow/buildPlayerArea.dart';
import 'package:scrow/gameState.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule the initializeGame() call for after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameState>(context, listen: false).initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    return Stack(
      children: [
        // Center boxes (simplified)
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Discard Pile (update to show the top discarded card later)
              Image.asset(
                gameState.discardPile.isNotEmpty
                    ? gameState.discardPile.last.imagePath
                    : 'assets/cards/back.png',
                width: 75,
                height: 100,
              ),
              const SizedBox(height: 20),
              // Deck (update to handle deck interactions later)
              GestureDetector(
                onTap: () {
                  // Add logic for drawing from the deck
                  gameState.drawFromDeck();
                },
                child: Image.asset(
                  'assets/cards/back.png',
                  width: 75,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
        // Player areas
        const Align(
          alignment: Alignment.topCenter,
          child: BuildPlayerArea(playerNumber: 1, playerIndex: 0),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: BuildPlayerArea(playerNumber: 3, playerIndex: 2),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: BuildPlayerArea(playerNumber: 4, playerIndex: 3),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: BuildPlayerArea(playerNumber: 2, playerIndex: 1),
        ),
      ],
    );
  }
}
