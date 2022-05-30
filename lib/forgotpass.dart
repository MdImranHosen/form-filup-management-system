import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForGet extends StatefulWidget{
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<ForGet>{
  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for(var u in jsonData){
      User user = User(u["name"], u["email"], u["username"]);
      users.add(user);
    }
    /*print(users.length);*/
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgotpass'),),
      body: Container(
        child: Card(child: FutureBuilder(
          future: getUserData(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data[i].name),
                    );
                  });
            }
          },
        ),),
      )
    );
  }
}

class User{
  final String name, email, userName;
  User(this.name, this.email, this.userName);
}