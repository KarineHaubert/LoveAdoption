
import 'package:flutter/material.dart';
import 'package:loveadoption/screens/adocaoPage/grid_view_pet.dart';

import 'package:loveadoption/screens/widgets/text.dart';

class AdocaoPage extends StatefulWidget {
  final int currentIndex;
  const AdocaoPage({
    Key key,
    this.currentIndex,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<AdocaoPage> {
  int petTipo1 = 0;
  int petTipo2 = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Visibility(
          visible: widget.currentIndex == 0 && petTipo1 == 0,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFFFA7D6A6)),
              title: TextWidget(
                text: 'Cães',
                color: Color(0xFFF807F7F),
                fontSize: 17,
              ),
            ),
            body: GetPets(
              petTipo: petTipo1,
            ),
          ),
          replacement: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFFFA7D6A6)),
              title: TextWidget(
                text: 'Gatos',
                color: Color(0xFFF807F7F),
                fontSize: 17,
              ),
            ),
            body: GetPets(
              petTipo: petTipo2,
            ),
          ),
        ),
      ],
    ));
  }
}
