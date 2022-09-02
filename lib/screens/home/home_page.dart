import 'package:flutter/material.dart';
import 'package:loveadoption/screens/home/components/bar_navigation.dart';
import 'package:loveadoption/screens/home/components/home.dart';


class Home extends StatefulWidget {
  
   final String uid;
  Home({
    Key key, this.uid,
  }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BarNavigator(),
      body: HomePage(),
    );
  }
}
