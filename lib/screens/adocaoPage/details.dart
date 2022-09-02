import 'package:flutter/material.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/screens/adocaoPage/background.dart';
import 'package:loveadoption/screens/widgets/button.dart';
import 'package:loveadoption/screens/widgets/text.dart';

class GridDetails extends StatefulWidget {
  GridDetails({
    Key key,
    this.pet,
  }) : super(key: key);
  final CadastroPet pet;

  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
          ),
          Column(children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.pet.photoURL),
                radius: 80,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextWidget(
              text: widget.pet.nomePet,
              fontSize: 30,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Detalhes',
                  fontSize: 18,
                  color: Color(0xFFF807F7F),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  height: 1,
                  width: 280,
                  decoration: BoxDecoration(color: Color(0xFFFC4C4C4)),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Sexo:',
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: widget.pet.sexo,
                      fontSize: 17,
                      color: Color(0xFFF709EE3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Estágio de vida:',
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: widget.pet.estagioVida,
                      fontSize: 17,
                      color: Color(0xFFF709EE3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Porte:',
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: widget.pet.porte,
                      fontSize: 17,
                      color: Color(0xFFF709EE3),
                    ),
                    SizedBox(
                      width: 102,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Vacinado:',
                      fontSize: 17,
                    ),
                    Icon(
                      widget.pet.vacinado == true ? Icons.check : Icons.close,
                      color: Color(0xFFF709EE3),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Castrado:',
                      fontSize: 17,
                    ),
                    Icon(
                      widget.pet.castrado == true ? Icons.check : Icons.close,
                      color: Color(0xFFF709EE3),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Microchipado:',
                      fontSize: 17,
                    ),
                    Icon(
                      widget.pet.microchipado == true
                          ? Icons.check
                          : Icons.close,
                      color: Color(0xFFF709EE3),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Localização',
                      fontSize: 18,
                      color: Color(0xFFF807F7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 1,
                      width: 260,
                      decoration: BoxDecoration(color: Color(0xFFFC4C4C4)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Cidade:',
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: widget.pet.cidade,
                      fontSize: 17,
                      color: Color(0xFFF709EE3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                      text: 'Estado:',
                      fontSize: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: widget.pet.estado,
                      fontSize: 17,
                      color: Color(0xFFF709EE3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Color(0xFFFA7D6A6),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.pet.fotoUser),
                          radius: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          TextWidget(
                              text: 'Postado por',
                              fontSize: 15,
                              color: Color(0xFFFC4C4C4)),
                          SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            text: widget.pet.nomeUser,
                            fontSize: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                Button(
                    width: 250,
                    press: () {},
                    child: Row(children: [
                      Image.asset(
                        'assets/images/whatsapp.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Enviar mensagem',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'roboto',
                            letterSpacing: 0.5,
                            color: Colors.white),
                      ),
                    ])),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
