import 'package:flutter/material.dart';

enum TextFieldType { text, password }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.validator,
    this.controller,
    this.type = TextFieldType.text,
  });

  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextFieldType type;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.type == TextFieldType.password
            ? Padding(
                padding: EdgeInsets.only(top: 8),
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              )
            : null,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      obscureText: widget.type == TextFieldType.password && _obscureText,
      obscuringCharacter: '•',
      validator: widget.validator,
    );
  }
}
