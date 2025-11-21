import 'package:flutter/material.dart';
import 'package:phonicsapp/widgets/custom_textfield.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool _hidepassword = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      label: "Password",
      obscureText: _hidepassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _hidepassword = !_hidepassword;
          });
        },
        icon: Icon(
          _hidepassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.white,
        ),
      ),
    );
  }
}
