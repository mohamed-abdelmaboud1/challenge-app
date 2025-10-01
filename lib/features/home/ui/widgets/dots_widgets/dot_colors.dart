import 'package:flutter/material.dart';

class DotColors {
  static final List<Color> _colors = [
    Colors.blue.shade500,
    Colors.red.shade500,
    Colors.green.shade500,
  ];

  static Color getColor(int index) {
    return _colors[index];
  }
}
