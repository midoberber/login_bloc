import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Color color;
  final Color borderColor;
  final Color shadowColorButton;
  final double elevationButton;
  final double borderWidth;
  final VoidCallback? onPressed;
  final Widget child;

  const GenericButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.borderWidth = 1,
    this.height = 50.0,
    this.color = Colors.blue,
    this.borderColor = Colors.transparent,
    this.shadowColorButton = Colors.transparent,
    this.elevationButton = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor, width: borderWidth),
          backgroundColor: Colors.transparent,
          shadowColor: shadowColorButton,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}
