import 'package:ducmc/login.dart';
import 'package:ducmc/register.dart';
import 'package:ducmc/forgotpass.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'forgotpass': (context) => ForGet()
    },
  ));
}




