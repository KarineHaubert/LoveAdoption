import 'package:flutter/material.dart';


class UnderlineButton extends StatelessWidget {
  final String text;
  final Function press;
  const UnderlineButton({
    Key key, this.text, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: press,
        child: Text(text,
            style: TextStyle(
                color: Color(0xFFF709EE3),
                fontSize: 15,
                fontFamily: 'roboto',
                letterSpacing: 0.5,
                decoration: TextDecoration.underline)),
      ),
    );
  }
}
