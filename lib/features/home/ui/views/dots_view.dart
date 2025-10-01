import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/dots_widgets/animated_dots_sequence.dart';
import '../widgets/dots_widgets/animation_control_buttons.dart';
import '../widgets/dots_widgets/loading_title.dart';

class DotsView extends HookWidget {
  const DotsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    useEffect(() {
      controller.repeat();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingTitle(),
            const SizedBox(height: 40),
            AnimatedDotsSequence(controller: controller),
            const SizedBox(height: 60),
            AnimationControlButtons(controller: controller),
          ],
        ),
      ),
    );
  }
}
