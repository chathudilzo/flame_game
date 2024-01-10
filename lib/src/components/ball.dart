// Import necessary libraries:
import 'package:flame/components.dart'; // For game components
import 'package:flutter/material.dart'; // For colors and painting styles
import '../brick_breaker.dart'; // Access game configuration and reference
import 'play_area.dart'; // For interacting with the PlayArea
import 'package:flame/collisions.dart'; // For collision handling

// Define the Ball class, representing the game ball:
class Ball extends CircleComponent with CollisionCallbacks, HasGameReference<BrickBreaker> {
  // Constructor:
  Ball({
    // Require initial velocity and position:
    required this.velocity,
    required super.position,
    // Require radius for ball size:
    required double radius,
  }) : super(
    // Set up visual properties:
    radius: radius,
    anchor: Anchor.center, // Center the ball at its position
    paint: Paint()
      ..color = const Color(0xff1e6091)
      ..style = PaintingStyle.fill, // Blue fill color
    // Add a collision hitbox for interactions:
    children: [CircleHitbox()],
  );

  // Store the ball's velocity for movement:
  final Vector2 velocity;

  // Override the update method, called every frame:
  @override
  void update(double dt) {
    super.update(dt); // Call parent's update method

    // Update the ball's position based on velocity and time:
    position += velocity * dt; // Move the ball according to its velocity
  }

  // Handle collisions with other components:
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    // Check for collision with the PlayArea:
    if (other is PlayArea) {
      // Bounce off the walls or remove the ball if it falls below the play area:
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y; // Bounce off the top
      } else if (intersectionPoints.first.x <= 0 || intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x; // Bounce off the sides
      } else if (intersectionPoints.first.y >= game.height) {
        removeFromParent(); // Remove the ball if it falls below the play area
      }
    } else {
      debugPrint('Collision with other $other'); // Log collisions with other components
    }
  }
}




// Here's a simple explanation of how that line of code works:

// Imagine the ball as a car:

// Velocity is like the car's speed and direction. It tells you how fast the car is going and where it's headed (e.g., 60 mph towards the north).
// Position is like the car's current location on a map (e.g., at a specific intersection).
// dt is like a small slice of time, representing how long it's been since the last time you checked the car's position (e.g., 1 second).
// Moving the car (or ball):

// Figure out how far the car would travel in that small time slice:

// Multiply the car's velocity (speed and direction) by the time slice (dt).
// This gives you the distance the car would move in that time (e.g., 60 meters towards the north in 1 second).
// Update the car's position on the map:

// Add this distance to the car's previous position.
// This shifts the car's location on the map, showing that it has moved.
// In the game, this happens every frame:

// The code calculates how far the ball should move based on its velocity and the time passed.
// It then adds that distance to the ball's current position, making it appear to smoothly travel across the screen.