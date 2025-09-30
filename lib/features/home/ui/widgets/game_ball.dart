import 'package:challenge_app/core/enums/ball_type.dart';
import 'package:flutter/material.dart';

class GameBall extends StatelessWidget {
  final BallType ballType;
  final double size;

  const GameBall({super.key, required this.ballType, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Draggable<BallType>(
      data: ballType,
      feedback: Image.asset(
        ballType.imagePath,
        height: size,
        width: size,
        opacity: const AlwaysStoppedAnimation<double>(0.7),
      ),
      childWhenDragging: Container(
        height: size - 10,
        width: size - 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Image.asset(ballType.imagePath, height: size, width: size),
          Text(
            ballType.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
        ],
      ),
    );
  }
}
