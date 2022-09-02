import 'package:flutter/material.dart';
import 'package:loveadoption/screens/widgets/text-field-container.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isObscure;
  final String Function(String) validator;
  final bool autoValidate;
  final double tamanho;
  final Function onSaved;

  final ValueChanged<String> onChanged;

  const InputField({
    Key key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.isObscure = false,
    this.validator,
    this.autoValidate,
    this.tamanho = 0, this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      tamanho: tamanho,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFFC4C4C4)),
            border: InputBorder.none),
        obscureText: isObscure,
      ),
    );
  }
}
