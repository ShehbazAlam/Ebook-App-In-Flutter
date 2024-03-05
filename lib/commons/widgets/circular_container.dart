import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, this.width, this.height, required this.radius, this.padding = 0, this.child, required this.backgroundColor, this.margin});

  final double? width, height;
  final double radius, padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor
      ),
      child: child,
    );
  }
}
