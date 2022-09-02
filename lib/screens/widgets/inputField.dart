import 'package:flutter/material.dart';
import 'package:loveadoption/screens/widgets/text-field-container.dart';

class TextFormFieldInput extends StatelessWidget {
  const TextFormFieldInput(
      {Key key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.isObscure,
      this.validator,
      this.autoValidate,
      this.tamanho,
      this.onSaved,
      this.onChanged})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isObscure;
  final String Function(String) validator;
  final bool autoValidate;
  final double tamanho;
  final Function onSaved;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      obscureText: isObscure,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFFC4C4C4)),
          border: InputBorder.none,
          prefix: TextFieldContainer(tamanho: tamanho,)),
      
    );
  }
}
