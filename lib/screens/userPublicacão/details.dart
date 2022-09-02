import 'package:flutter/material.dart';
import 'package:loveadoption/Services/publicacao/publicacao_service.dart';
import 'package:loveadoption/Services/services.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/screens/adocaoPage/background.dart';
import 'package:loveadoption/screens/cadastroPet/body.dart';
import 'package:loveadoption/screens/userPublicac%C3%A3o/user_publicacao.dart';
import 'package:loveadoption/screens/widgets/Alert_dialog.dart';
import 'package:loveadoption/screens/widgets/text.dart';

class DetailsPublicacaoUser extends StatefulWidget {
  DetailsPublicacaoUser({Key key, this.pet}) : super(key: key);
  final CadastroPet pet;

  @override
  _DetailsPublicacaoUserState createState() => _DetailsPublicacaoUserState();
}

class _DetailsPublicacaoUserState extends State<DetailsPublicacaoUser> {
  final CadastroPetService _cadastroPetService =
      instance.get<CadastroPetService>();

  void choicesAction(String choice) {
    if (choice == Constants.excluir) {
      print('Click');
      var baseDialog = BaseAlertDialog(
        title: 'Deseja excluir publicação? ',
        content:
            "Esta publicação será excluída permanentemente, deseja continuar?",
        no: 'Cancelar',
        yes: 'Excluir',
        yesOnPressed: () {
          _cadastroPetService.deletePet(widget.pet.uid);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserPublicacao();
          }));
        },
        noOnPressed: () {
          Navigator.of(context).pop();
        },
      );
      showDialog(
          context: context, builder: (BuildContext context) => baseDialog);
    }

    if (choice == Constants.editar) {
      print(widget.pet.nomePet);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Body(
            pet: widget.pet,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(children: [
      AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UserPublicacao();
                      }),
                    );
                  },
                ),
        actions: [
          PopupMenuButton(
            onSelected: choicesAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
           
        ],
      ),
      Column(
        children: [
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
          Column(children: [
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
          ])
        ],
      ),
    ]));
  }
}

class Constants {
  static const String excluir = "excluir";
  static const String editar = 'editar';

  static const List<String> choices = [excluir, editar];
}
