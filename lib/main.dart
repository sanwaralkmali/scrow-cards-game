import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrow/gameScreen.dart';
import 'package:scrow/gameState.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scrow Game'),
        ),
        body: GameScreen(),
      ),
    );
  }
}
