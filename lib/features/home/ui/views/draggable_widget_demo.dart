import 'package:audioplayers/audioplayers.dart';
import 'package:challenge_app/core/enums/ball_type.dart';
import 'package:challenge_app/features/home/ui/widgets/game_ball.dart';
import 'package:challenge_app/features/home/ui/widgets/task_manager_widgets/game_target.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DraggableWidgetDemo extends StatefulWidget {
  const DraggableWidgetDemo({super.key});

  @override
  State<DraggableWidgetDemo> createState() => _DraggableWidgetDemoState();
}

class _DraggableWidgetDemoState extends State<DraggableWidgetDemo> {
  late final ConfettiController confettiController;
  late final Map<BallType, VideoPlayerController?> videoControllers;
  late final Map<BallType, bool> videoStates;
  late final Map<BallType, BallType?> acceptedBalls;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    videoControllers = {for (BallType type in BallType.values) type: null};
    videoStates = {for (BallType type in BallType.values) type: false};
    acceptedBalls = {for (BallType type in BallType.values) type: null};
  }

  @override
  void dispose() {
    confettiController.dispose();
    for (final controller in videoControllers.values) {
      controller?.dispose();
    }
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playSuccessSound() async {
    try {
      await audioPlayer.play(AssetSource('sounds/success.m4a'));
    } catch (e) {
      debugPrint("Error playing sound: $e");
    }
  }

  Future<void> playVideoForTarget(BallType targetType) async {
    videoControllers[targetType]?.dispose();
    videoControllers[targetType] = VideoPlayerController.asset(
      "assets/videos/wrong.mp4",
    );

    final controller = videoControllers[targetType];
    if (controller != null) {
      await controller.initialize();
      controller.play();

      setState(() {
        videoStates[targetType] = true;
      });

      controller.addListener(() {
        if (controller.value.position >= const Duration(seconds: 6)) {
          setState(() {
            videoStates[targetType] = false;
          });
          controller.pause();
        }
      });
    }
  }

  void handleCorrectMatch(BallType ballType) async {
    confettiController.play();
    await playSuccessSound();
    setState(() {
      acceptedBalls[ballType] = ballType;
    });
  }

  void handleWrongMatch(BallType targetType) async {
    await playVideoForTarget(targetType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        // Draggable Balls Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: BallType.values
              .map(
                (ballType) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GameBall(ballType: ballType),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 30),
        // Drag Targets Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: BallType.values
              .map(
                (ballType) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GameTarget(
                    targetType: ballType,
                    confettiController: confettiController,
                    showVideo: videoStates[ballType]!,
                    videoController: videoControllers[ballType],
                    acceptedBall: acceptedBalls[ballType],
                    onCorrectMatch: handleCorrectMatch,
                    onWrongMatch: handleWrongMatch,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        // Confetti Widget
        ConfettiWidget(
          confettiController: confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          emissionFrequency: 0.05,
          numberOfParticles: 25,
          maxBlastForce: 20,
          minBlastForce: 5,
          gravity: 0.3,
        ),
      ],
    );
  }
}
