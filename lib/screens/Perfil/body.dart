import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loveadoption/screens/Perfil/background.dart';
import 'package:loveadoption/screens/login/login_page.dart';
import 'package:loveadoption/screens/widgets/Alert_dialog.dart';
import 'package:loveadoption/screens/widgets/button.dart';
import 'package:loveadoption/Services/Auth/Auth.dart';

class Body extends StatefulWidget {
  final GoogleSignInAccount googleUser;
  final User firebaseUser;
  const Body({Key key, this.googleUser, this.firebaseUser}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Perfil',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'roboto',
                    letterSpacing: 0.5,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 80,
              ),
            ),
            Text(
              nomeCompleto,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'roboto',
                letterSpacing: 0.5,
                color: Color(0xFFFC4C4C4),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size. height * 0.3),
            Button(
                  child: Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'roboto',
                            letterSpacing: 0.5,
                            color: Colors.white),
                      ),
                width: size.width * 0.6,
                press: () {
                  var baseDialog = BaseAlertDialog(
                    title: 'Deseja sair?',
                    content: "",
                    no: 'Cancelar',
                    yes: 'Sair',
                    yesOnPressed: () {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), ModalRoute.withName('/'));
                    },
                    noOnPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => baseDialog);
                })
          ],
        ),
      ),
    );
  }
}
