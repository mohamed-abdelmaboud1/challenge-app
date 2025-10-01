import 'package:flutter/material.dart';

import 'dot_colors.dart';

class AnimatedDot extends StatelessWidget {
  final int index;
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;

  const AnimatedDot({
    super.key,
    required this.index,
    required this.scaleAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleAnimation.value,
      child: Opacity(
        opacity: fadeAnimation.value,
        child: DotContainer(color: DotColors.getColor(index)),
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  final Color color;

  const DotContainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
