import 'package:flutter/material.dart';

import 'play_pause_button.dart';
import 'restart_button.dart';

class AnimationControlButtons extends StatelessWidget {
  final AnimationController controller;

  const AnimationControlButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayPauseButton(controller: controller),
        const SizedBox(width: 20),
        RestartButton(controller: controller),
      ],
    );
  }
}
