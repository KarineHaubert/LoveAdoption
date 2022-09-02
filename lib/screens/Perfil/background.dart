import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,  @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          body: Container(
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0,
              left: size.width * -0.2,
              child: Image.asset(
                'assets/images/VetorPerfil.png',
                width: size. width * 1.5,
                height: size.height * 0.3,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
