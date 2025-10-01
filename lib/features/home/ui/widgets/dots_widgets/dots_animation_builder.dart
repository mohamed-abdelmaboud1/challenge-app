// import 'package:flutter/material.dart';


// class DotsAnimationBuilder extends StatelessWidget {
//   final AnimationController controller;
//   final   builder;

//   const DotsAnimationBuilder({
//     super.key,
//     required this.controller,
//     required this.builder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final scaleAnimations = _createScaleAnimations();
//     final fadeAnimations = _createFadeAnimations();

//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         return builder(context, scaleAnimations, fadeAnimations);
//       },
//     );
//   }


// }
