import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loveadoption/Services/Auth/Auth.dart';
import 'package:loveadoption/Services/publicacao/publicacao_service.dart';
import 'package:loveadoption/Services/services.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/screens/userPublicac%C3%A3o/details.dart';
import 'package:loveadoption/screens/widgets/text.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CadastroPetService _cadastroPetService =
      instance.get<CadastroPetService>();

  CadastroPet pet;
  String userUid;

  gridViewPets(AsyncSnapshot<List<CadastroPet>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: snapshot.data.map((pet) {
            return GestureDetector(
              child: GridTile(
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        pet.photoURL),
                                    fit: BoxFit.cover),
                              )
                            ),
                    Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(5),
                        child: TextWidget(
                          text: pet.nomePet,
                          color: Colors.white,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
              onTap: () {
                detailPage(context, pet);
              },
            );
          }).toList()),
    );
  }

  detailPage(BuildContext context, CadastroPet pet) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => DetailsPublicacaoUser(
                  pet: pet,
                )));
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CadastroPet>>(
        future: _cadastroPetService.getPetsByUserId(currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return gridViewPets(snapshot);
          }
          if (currentUser.uid != null) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/GatoLa.png'),
                  ),
                  Text(
                    'Ops... não há nada para ver aqui.',
                    style: TextStyle(
                        color: Color(0xFFF807F7F),
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
          return circularProgress();
        });
  }
}
