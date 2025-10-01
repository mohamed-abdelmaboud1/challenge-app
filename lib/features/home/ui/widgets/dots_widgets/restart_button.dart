import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final AnimationController controller;

  const RestartButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.reset();
        controller.repeat();
      },
      child: const Text('Restart'),
    );
  }
}
