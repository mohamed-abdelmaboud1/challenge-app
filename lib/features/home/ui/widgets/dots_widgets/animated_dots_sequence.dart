import 'package:challenge_app/features/home/ui/widgets/dots_widgets/dots_row.dart';
import 'package:flutter/material.dart';

class AnimatedDotsSequence extends StatelessWidget {
  final AnimationController controller;

  const AnimatedDotsSequence({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final scaleAnimations = _createScaleAnimations();
        final fadeAnimations = _createFadeAnimations();

        return DotsRow(
          scaleAnimations: scaleAnimations,
          fadeAnimations: fadeAnimations,
        );
      },
    );
  }

  List<Animation<double>> _createScaleAnimations() {
    return List.generate(3, (index) {
      final startTime = index * 0.2;
      final endTime = startTime + 0.4;

      return Tween<double>(begin: 0.3, end: 1.2).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(startTime, endTime, curve: Curves.elasticOut),
        ),
      );
    });
  }

  List<Animation<double>> _createFadeAnimations() {
    return List.generate(3, (index) {
      final startTime = index * 0.2;
      final endTime = startTime + 0.5;

      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(startTime, endTime, curve: Curves.easeInOut),
        ),
      );
    });
  }
}
