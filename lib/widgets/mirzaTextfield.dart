import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final Color? iconColor;
  final TextInputType? keyboardType;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Future<Null> Function()? onTap;
  final double height;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.validator,
    this.icon,
    this.iconColor,
    this.keyboardType,
    this.enabled = true,
    this.inputFormatters,
    this.onTap,
    this.height = 40.0,
    this.borderRadius = 12.0,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        onTap: widget.onTap,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.icon != null
              ? Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Icon(
              widget.icon,
              color: widget.iconColor ?? Colors.grey,
            ),
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
