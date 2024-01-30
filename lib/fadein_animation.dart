
import 'package:flutter/material.dart';

class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    super.key,
    required this.body,
    required this.duration
  });

  final Widget body;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: const ValueKey('logo'),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.ease,
      duration: Duration(seconds: duration),
      builder: (BuildContext context, double opacity, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: body,
        );
      }
    );
  }
}