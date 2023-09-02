import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? borderRadius;
  final double buttonSize;
  final Color? fillColor;

  CustomIconButton({
    required this.icon,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 1,
    this.borderRadius,
    required this.buttonSize,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius!),
      child: Container(
        height: buttonSize,
        width: buttonSize,
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
