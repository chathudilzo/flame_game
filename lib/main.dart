// Import the Flame package for game development:
import 'package:flame/game.dart';
import 'package:flame_game/src/brick_breaker.dart';

// Import the Material package for UI elements:
import 'package:flutter/material.dart';

void main() {
  // Create an instance of the FlameGame class,
  // which manages the core game loop and rendering:
  final game = BrickBreaker();

  // Run the application using the GameWidget,
  // which integrates the Flame game into a Flutter app:
  runApp(GameWidget(game: game));
}
