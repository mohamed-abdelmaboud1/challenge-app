import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final AnimationController controller;

  const PlayPauseButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.isAnimating) {
          controller.stop();
        } else {
          controller.repeat();
        }
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Text(controller.isAnimating ? 'Pause' : 'Play');
        },
      ),
    );
  }
}
