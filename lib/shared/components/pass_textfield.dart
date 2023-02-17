import 'package:flutter/material.dart';
class PassTextField extends StatefulWidget {
  final String label;
  final TextEditingController? customController;
  PassTextField({required this.label, this.customController});

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPassword,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPassword = isPassword;
            });
          },
          icon: Icon(
            isPassword ? Icons.visibility_off : Icons.visibility,
            color: Color(0xffe5e2e2ff),
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