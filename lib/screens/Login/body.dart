import 'package:flutter/material.dart';
import 'package:loveadoption/models/usuario.dart';
import 'package:loveadoption/screens/home/home_page.dart';
import 'package:loveadoption/Services/Auth/Auth.dart';
import 'package:loveadoption/screens/login/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Usuario usuario;
  String telefone;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: size. height * 0.09,
            left: size. width * 0.1,
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white)),
                color: Colors.transparent,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                onPressed: () {
                  try {
                    signInWithGoogle().then((dynamic) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    });
                  } catch (e) {
                    final snackBar =
                        SnackBar(content: Text('Erro ao fazer login'));
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/logoGoogle.png",
                      width: size.width * 0.09,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Entrar com google",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'roboto',
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
