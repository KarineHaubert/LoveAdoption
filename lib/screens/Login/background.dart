import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        color: Color(0xFF709EE3), 
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 150,
              child: Image.asset(
                'assets/images/ImageWelcome.png',
               height: size.height * 1,
                width: size.width * 1,
                
              ),
            ),
            Positioned(
              bottom: size.height * 0.55,
              child: Image.asset(
                'assets/images/vetorWelcome.png',
                width: size.width * 1.2,
              ),
            ),
            Positioned(
              bottom: size.height * 0.65,
              right: 15,
              child: Image.asset(
                'assets/images/logoCompleta.png',
                width: size.width * 0.9,
              ),
            ),
            child,
          ],
        )
      );
   }
}
