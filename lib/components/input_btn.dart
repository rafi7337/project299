import 'package:flutter/material.dart';

class InputBtn extends StatefulWidget {
  final String inputLabelText;
  final String inputHintText;
  final IconData prefixLabelIcon;
  final bool isPasswordField; // Flag to decide if the field is for password
  final String? Function(String?) validator; // Custom validator function

  const InputBtn({
    super.key,
    required TextEditingController emailController,
    required FocusNode focusNode,
    required this.inputHintText,
    required this.inputLabelText,
    required this.prefixLabelIcon,
    this.isPasswordField = false, // default to false
    required this.validator,
  })  : _emailController = emailController,
        _focusNode = focusNode;

  final TextEditingController _emailController;
  final FocusNode _focusNode;

  @override
  State<InputBtn> createState() => _InputBtnState();
}

class _InputBtnState extends State<InputBtn> {
  bool _obscureText = true; // Default is to hide the password

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._emailController,
      focusNode: widget._focusNode,
      keyboardType: widget.isPasswordField
          ? TextInputType.text
          : TextInputType.emailAddress, // Use text input for password fields
      obscureText: widget.isPasswordField &&
          _obscureText, // If password field, hide text
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixLabelIcon,
          color: Colors.greenAccent, // Color of the email icon
        ),
        labelText: widget.inputLabelText,
        labelStyle: TextStyle(
          color: Colors.teal, // Color of the label text
          fontSize: 16, // Size of the label text
          fontWeight: FontWeight.w500, // Weight for a professional look
        ),
        hintText: widget.inputHintText, // Optional hint to guide the user
        hintStyle: TextStyle(
          color: Colors.grey[600], // Light gray hint text
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12), // Rounded corners for a modern look
          borderSide: BorderSide(
            color: Colors.greenAccent, // Color for the border
            width: 2, // Slightly thicker border
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[400]!, // Light gray border when not focused
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.greenAccent, // Color when the field is focused
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red, // Border color when there's an error
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors
                .red, // Border color when the field is focused and invalid
            width: 2,
          ),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle visibility
                  });
                },
              )
            : null, // No suffix icon if it's not a password field
      ),
      style: TextStyle(
        color: Colors.grey[600], // Color of the text while typing
      ),
      validator: widget.validator, // Use the validator passed to the widget
    );
  }
}
