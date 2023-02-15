import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  final String label;
  final bool secure;
  final TextEditingController? customController;
  CustomTextField({required this.label, this.secure = false,this.customController});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: widget.secure,
      controller: widget.customController,
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1
          ),
        ),
      ),
    );
  }
}
