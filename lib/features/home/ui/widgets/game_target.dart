import 'package:challenge_app/core/enums/ball_type.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GameTarget extends StatelessWidget {
  final BallType targetType;
  final ConfettiController confettiController;
  final bool showVideo;
  final VideoPlayerController? videoController;
  final BallType? acceptedBall;
  final Function(BallType) onCorrectMatch;
  final Function(BallType) onWrongMatch;
  final double size;

  const GameTarget({
    super.key,
    required this.targetType,
    required this.confettiController,
    required this.showVideo,
    required this.videoController,
    required this.acceptedBall,
    required this.onCorrectMatch,
    required this.onWrongMatch,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragTarget<BallType>(
          builder: (context, accepted, rejected) {
            // Show video only for this specific target
            if (showVideo && videoController != null) {
              return SizedBox(
                width: size,
                height: size,
                child: AspectRatio(
                  aspectRatio: videoController!.value.aspectRatio,
                  child: VideoPlayer(videoController!),
                ),
              );
            }

            // Show the accepted ball image if there's a correct match
            if (acceptedBall != null) {
              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: targetType.color.withValues(alpha: 0.2),
                  border: Border.all(color: targetType.color, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    acceptedBall!.imagePath,
                    height: size * 0.6,
                    width: size * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }

            // Default target appearance
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: accepted.isNotEmpty
                    ? targetType.color.withValues(alpha: 0.3)
                    : targetType.color.withValues(alpha: 0.8),
                border: Border.all(color: targetType.color, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.circle, size: 40, color: Colors.white),
            );
          },
          onWillAcceptWithDetails: (details) => true,
          onAcceptWithDetails: (details) {
            if (details.data == targetType) {
              onCorrectMatch(details.data);
            } else {
              onWrongMatch(targetType);
            }
          },
        ),
        const SizedBox(height: 8),
        Text(
          "${targetType.label} Target",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }
}
