
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:loveadoption/Services/services.dart';
import 'package:loveadoption/screens/Login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
