import 'package:flutter/material.dart';

class PulsingDots extends StatelessWidget {
  const PulsingDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            double opacity = (value - (index * 0.3)).clamp(0.0, 1.0);
            return Opacity(
              opacity: opacity,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
      onEnd: () {
        // rebuild animation loop
      },
    );
  }
}
