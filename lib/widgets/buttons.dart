import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final double? iconSize;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final double elevation;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.iconSize,
    this.color,
    this.textColor,
    this.iconColor,
    this.elevation = 4.0,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: iconSize, color: iconColor ?? textColor) : const SizedBox.shrink(),
      label: Text(buttonText, style: TextStyle(color: textColor, fontSize: 16.0)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        elevation: elevation,
      ),
    );
  }
}
class ColorfulOvalButton extends StatelessWidget {
  final String label;
  final String route;

  const ColorfulOvalButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Change this to your desired color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Oval shape
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white, // Change this to your desired text color
          ),
        ),
      ),
    );
  }
}