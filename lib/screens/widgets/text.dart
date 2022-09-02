import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  
  const TextWidget( {Key key, this.text, this.color, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style:TextStyle(
          color: color,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
