import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loveadoption/screens/Perfil/perfil_screen.dart';
import 'package:loveadoption/screens/home/components/home.dart';

class BarNavigator extends StatefulWidget {

  const BarNavigator({
    Key key,
  }) : super(key: key);

  @override
  _BarNavigatorState createState() => _BarNavigatorState();
}

class _BarNavigatorState extends State<BarNavigator> {
  int _currentIndex = 0;

  final _screen = [
    Center(
      child: HomePage(),
    ),
    Center(
      child: Perfil(),
    )
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFFFC4C4C4),
          selectedItemColor: Color(0xFFF709EE3),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pets
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'roboto',
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Perfil',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'roboto',
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
