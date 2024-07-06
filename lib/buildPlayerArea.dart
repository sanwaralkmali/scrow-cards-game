import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrow/gameState.dart';

class BuildPlayerArea extends StatefulWidget {
  final int playerNumber; // Player 1, 2, 3, or 4
  final int playerIndex; // Index in the players list (0, 1, 2, or 3)

  const BuildPlayerArea({
    Key? key,
    required this.playerNumber,
    required this.playerIndex,
  }) : super(key: key);

  @override
  _BuildPlayerAreaState createState() => _BuildPlayerAreaState();
}

class _BuildPlayerAreaState extends State<BuildPlayerArea> {
  bool showCards = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      setState(() {
        showCards = false; // Hide cards after 10 seconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    if (gameState.players.isEmpty ||
        widget.playerIndex >= gameState.players.length) {
      return const SizedBox.shrink(); // Or a placeholder widget
    }

    final player = gameState.players[widget.playerIndex];
    print(player.hand.length);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Player ${widget.playerNumber}:'),
        if (widget.playerNumber == 1 || widget.playerNumber == 3)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              player.hand.length, // Use player.hand.length
              (cardIndex) => GestureDetector(
                onTap: () {
                  // TODO: Handle card tap logic
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    // Check if enough cards and if face-up
                    (cardIndex < 2) && (gameState.initialTimeElapsed)
                        ? player.hand[cardIndex].imagePath
                        : player.hand[cardIndex].backPath,
                    width: 50.00,
                  ),
                ),
              ),
            ),
          ),
        if (widget.playerNumber == 2 || widget.playerNumber == 4)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              player.hand.length, // Use player.hand.length
              (cardIndex) => GestureDetector(
                onTap: () {
                  // TODO: Handle card tap logic
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    (cardIndex < 2) && (gameState.initialTimeElapsed)
                        ? player.hand[cardIndex].imagePath
                        : player.hand[cardIndex].backPath,
                    width: 50.00,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
