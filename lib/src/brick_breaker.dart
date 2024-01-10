// Import necessary libraries:
import 'dart:async'; // For asynchronous operations
import 'package:flame/camera.dart'; // For camera management
import 'package:flame/components.dart'; // For game components
import 'package:flame/extensions.dart'; // For additional extensions
import 'package:flame/game.dart'; // For the FlameGame class
import 'package:flame_game/src/components/components.dart'; // For game components
import 'package:flame_game/src/components/play_area.dart'; // For the PlayArea component
import 'package:flame_game/src/config.dart'; // For game configuration
import 'dart:math' as math; // For random number generation

// Define the BrickBreaker class, extending FlameGame to create the game structure:
class BrickBreaker extends FlameGame with HasCollisionDetection{
  // Constructor:
  BrickBreaker() : super(
    // Set up a fixed-resolution camera to maintain a consistent viewport:
    camera: CameraComponent.withFixedResolution(
      width: gameWidth, // Use gameWidth from config
      height: gameHeight, // Use gameHeight from config
    ),
  );

  // Getters for game width and height:
  final rand = math.Random(); // Create a random number generator
  double get width => size.x;
  double get height => size.y;

  // Override the onLoad method, called when the game starts:
  @override
  FutureOr<void> onLoad() async {
    super.onLoad(); // Call parent's onLoad method

    // Align the camera's viewport to the top-left corner of the game world:
    camera.viewfinder.anchor = Anchor.topLeft;

    // Add the PlayArea component to the game world:
    world.add(PlayArea());

    // Create and add the ball to the game world:
    world.add(Ball(
      position: size / 2, // Center the ball initially
      radius: ballRadius,
      velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2) // Random initial velocity
        .normalized() // Normalize for consistent speed
        ..scale(height / 4), // Adjust speed based on screen height
    ));

    debugMode = true; // Enable debug mode for visual aids
  }
}
