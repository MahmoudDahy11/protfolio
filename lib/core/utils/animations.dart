import 'package:flutter/material.dart';

class AppAnimations {
  static const Duration defaultDuration = Duration(milliseconds: 300);
  static const Duration hoverDuration = Duration(milliseconds: 200);
  static const Curve hoverCurve = Curves.easeOutBack;
  static const Curve entranceCurve = Curves.elasticOut;

  static const double hoverScale = 1.05;
  static const double hoverTranslateY = -10.0;
}
