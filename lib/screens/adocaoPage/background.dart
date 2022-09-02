import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: -100,
              top: -20,
              child: Image.asset(
                'assets/images/VetorDetail.png',
                height: 250,
                width: 550,
              ),
            ),
            child
          ],
        ),
      )),
    );
  }
}
