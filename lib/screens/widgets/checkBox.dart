import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;

  const CheckBox({Key key, this.value, this.onChanged, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
        activeColor: Color(0xFFFA7D6A6),
        value: value,
        onChanged: onChanged,
      ),
      Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 17,
        ),
      )
    ]);
  }
}
