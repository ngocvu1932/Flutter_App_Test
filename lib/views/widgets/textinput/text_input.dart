import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final TextEditingController passwordController;
  final String password;
  bool isPasswordVisible;

  TextInput({
    super.key,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.password,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: !widget.isPasswordVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(!widget.isPasswordVisible
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () => {
            setState(() {
              widget.isPasswordVisible = !widget.isPasswordVisible;
            })
          },
        ),
        labelText: widget.password,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
