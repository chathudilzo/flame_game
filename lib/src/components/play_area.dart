// Import necessary libraries:
import 'dart:async'; // For asynchronous operations
import 'package:flame/components.dart'; // For game components
import 'package:flame_game/src/brick_breaker.dart'; // For game reference
import 'package:flutter/material.dart'; // For colors
import 'package:flame/collisions.dart';


// Define the PlayArea class, responsible for visual representation of the game's play area:
class PlayArea extends RectangleComponent with HasGameReference<BrickBreaker> {
  // Constructor:
  PlayArea() : super(
    // Initialize with a light brown background color:
    paint: Paint()..color = const Color(0xfff2e8cf),
    children: [RectangleHitbox()]
  );

  // Override the onLoad method, called when the component is first added to the game:
  @override
  FutureOr<void> onLoad() async {
    super.onLoad(); // Call parent's onLoad method for any setup

    // Set the size of the play area to match the game's dimensions, ensuring it fills the screen:
    size = Vector2(game.width, game.height); // Access game dimensions using HasGameReference mixin
  }
}
