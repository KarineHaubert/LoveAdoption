import 'package:flutter/material.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/screens/cadastroPet/body.dart';

class CadastroPetPage extends StatefulWidget {
  const CadastroPetPage({Key key, this.pet}) : super(key: key);
 final CadastroPet pet;

  @override
  _CadastroPetPageState createState() => _CadastroPetPageState();
}

class _CadastroPetPageState extends State<CadastroPetPage> {
  // final DbCadastroPetService _cadastroPetService =
  //     services.get<CadastroPetService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
