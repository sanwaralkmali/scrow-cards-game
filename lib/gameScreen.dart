// ignore: file_names
import 'package:flutter/material.dart';
import 'package:scrow/data/deck.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});
  Deck deck = Deck();

  @override
  Widget build(BuildContext context) {
    deck.shuffle();
    return Stack(
      children: [
        // Center boxes
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 75,
                height: 100,
                color: Colors.red, // Discard pile
                child: const Center(child: Text('Discard')),
              ),
              const SizedBox(height: 20),
              Container(
                width: 75,
                height: 100,
                color: Colors.green, // Deck
                child: const Center(child: Text('Deck')),
              ),
            ],
          ),
        ),
        // Player areas
        Align(alignment: Alignment.topCenter, child: _buildPlayerArea(1)),
        Align(alignment: Alignment.bottomCenter, child: _buildPlayerArea(3)),
        Align(alignment: Alignment.centerLeft, child: _buildPlayerArea(2)),
        Align(alignment: Alignment.centerRight, child: _buildPlayerArea(4)),
      ],
    );
  }

  Widget _buildPlayerArea(int playerNumber) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Player $playerNumber:'),
        if (playerNumber == 1 || playerNumber == 3)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int card = 0; card < 4; card++)
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'assets/cards/${deck.drawCard().imagePath}',
                    width: 50.00,
                  ),
                ),
            ],
          ),
        if (playerNumber == 2 || playerNumber == 4)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int card = 0; card < 4; card++)
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'assets/cards/${deck.drawCard().imagePath}',
                    width: 50.00,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
