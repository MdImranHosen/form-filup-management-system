import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
   @override
     Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text('Welcome'),),
         body: Center(child: Text('Welcome to your Dashboard', style:TextStyle(fontSize:30,fontWeight:FontWeight.bold)),),
      );
     }
}