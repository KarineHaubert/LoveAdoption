import 'package:flutter/material.dart';
import 'package:loveadoption/screens/home/home_page.dart';
import 'package:loveadoption/screens/userPublicacão/body.dart';
import 'package:loveadoption/screens/widgets/text.dart';

class UserPublicacao extends StatefulWidget {
  UserPublicacao({Key key}) : super(key: key);

  @override
  _UserPublicacaoState createState() => _UserPublicacaoState();
}

class _UserPublicacaoState extends State<UserPublicacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFFFA7D6A6)),
        title: TextWidget(
          text: 'Minhas publicações',
          color: Color(0xFFF807F7F),
          fontSize: 17,
        ),
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Home();
              }),
            );
          },
        ),
      ),
      body: Body(),
    );
  }
}
