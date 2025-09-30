import 'package:challenge_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class TaskManagerBackground extends StatelessWidget {
  final Widget child;

  const TaskManagerBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imagesFlutterMentors3Logo),
          fit: BoxFit.contain,
          opacity: 0.1,
          alignment: Alignment.center,
        ),
      ),
      child: child,
    );
  }
}
