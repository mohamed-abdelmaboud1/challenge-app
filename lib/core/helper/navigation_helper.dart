import 'package:flutter/material.dart';

class NavigationHelper {
  // Fade Transition
  static void pushWithFadeTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);

          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );
  }

  // Slide Transition
  static void pushWithSlideTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 300),
    Offset beginOffset = const Offset(0, 1),
    Offset endOffset = const Offset(0, 0),
    Curve curve = Curves.easeInOut,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: transitionDuration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: beginOffset,
            end: endOffset,
          ).chain(CurveTween(curve: curve));
          var slideAnimation = animation.drive(tween);

          return SlideTransition(position: slideAnimation, child: child);
        },
      ),
    );
  }

  // Scale Transition
  static void pushWithScaleTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.elasticOut,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var scaleAnimation = animation.drive(tween);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      ),
    );
  }

  // Rotation Transition
  static void pushWithRotationTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var rotationAnimation = animation.drive(tween);

          return RotationTransition(turns: rotationAnimation, child: child);
        },
      ),
    );
  }

  // Size Transition
  static void pushWithSizeTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 400),
    Axis axis = Axis.vertical,
    Curve curve = Curves.easeInOut,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var sizeAnimation = animation.drive(tween);

          return SizeTransition(
            axis: axis,
            sizeFactor: sizeAnimation,
            child: child,
          );
        },
      ),
    );
  }

  // Combined Slide + Fade Transition
  static void pushWithSlideAndFadeTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 300),
    Offset beginOffset = const Offset(1.0, 0.0),
    Curve curve = Curves.easeInOut,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var slideTween = Tween(
            begin: beginOffset,
            end: Offset.zero,
          ).chain(CurveTween(curve: curve));
          var fadeTween = Tween(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: curve));

          var slideAnimation = animation.drive(slideTween);
          var fadeAnimation = animation.drive(fadeTween);

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
      ),
    );
  }

  // Custom Material Page Route (iOS-like)
  static void pushWithCupertinoTransition(
    BuildContext context,
    Widget page, {
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.linearToEaseOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var slideAnimation = animation.drive(tween);

          return SlideTransition(position: slideAnimation, child: child);
        },
      ),
    );
  }
}
