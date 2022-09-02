import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Widget child;
  final Function press;
  final double width;
  const Button({
    Key key,
    this.text,
    this.press,
    this.width, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: Color(0xFFFA7D6A6),
          onPressed: press,
          child: child
        ),
      ),
    );
  }
}
