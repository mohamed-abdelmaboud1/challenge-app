import 'package:challenge_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

enum BallType {
  red(AppImages.imagesRedBall, Colors.red, "Red"),
  yellow(AppImages.imagesYellowBall, Colors.yellow, "Yellow"),
  blue(AppImages.imagesBlueBall, Colors.blue, "Blue");

  const BallType(this.imagePath, this.color, this.label);

  final String imagePath;
  final Color color;
  final String label;
}
