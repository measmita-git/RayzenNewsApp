import 'package:flutter/material.dart';

class DTButton extends StatelessWidget {
  final VoidCallback onClick;
  final String label;
  final Color buttonColor;
  final double borderRadius;
  final Color borderColor;
  final double width;
  final double height;
  final Color textColor;
  final TextAlign textAlign;

  DTButton({
    required this.onClick,
    required this.label,
    required this.buttonColor,
    required this.borderRadius,
    required this.borderColor,
    required this.width,
    required this.height,
    required this.textColor,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: textAlign,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

