import 'package:challenge_app/features/home/ui/widgets/dots_widgets/animated_dot.dart';
import 'package:flutter/material.dart';

class DotsRow extends StatelessWidget {
  final List<Animation<double>> scaleAnimations;
  final List<Animation<double>> fadeAnimations;

  const DotsRow({
    super.key,
    required this.scaleAnimations,
    required this.fadeAnimations,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: AnimatedDot(
            index: index,
            scaleAnimation: scaleAnimations[index],
            fadeAnimation: fadeAnimations[index],
          ),
        );
      }),
    );
  }
}
