import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  final String hint;
  final TextEditingController ctlr;
  final IconData ? icon;
  final TextInputType type;
  final int ? maxLength;
  final bool obscureText;

  const Input({Key? key, required this.hint, required this.ctlr, this.icon, required this.type, this.maxLength, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: type,
        style: TextStyle(fontSize: 20),
        maxLength: maxLength,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon == null ? null : Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6)
          )
        ),
        obscureText: obscureText == false ? false : true,
        controller: ctlr ,
      ),
    );
  }
}

