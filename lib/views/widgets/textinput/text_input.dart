import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final TextEditingController controllers;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool? obscureText;

  TextInput({
    super.key,
    required this.controllers,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllers,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
