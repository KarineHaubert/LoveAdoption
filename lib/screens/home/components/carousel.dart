import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  final String image;
  final bool activePage;

  final String inicialtext;
  final String finalText;

  CarouselSlider(
      {Key key, this.image, this.activePage, this.inicialtext, this.finalText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = this.activePage ? 50 : 80;
    final double blur = this.activePage ? 5 : 0;
    final double offset = this.activePage ? 10 : 0;

    return AnimatedContainer(
        curve: Curves.easeInQuad,
        duration: Duration(microseconds: 500),
        margin: EdgeInsets.only(top: top, bottom: 50, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(this.image),
              fit: BoxFit.cover,

            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: blur,
                offset: Offset(offset, offset),
              )
            ]),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 380,),

                Container(
                  child: Text(this.inicialtext,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 35,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 250,
                      decoration: BoxDecoration(color: Colors.white),
                    )
                  ],
                ),
                Container(
                  child: Text(
                    this.finalText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

