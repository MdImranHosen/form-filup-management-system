import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ducmc/welcome.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async{
    var response = await http.post(
        Uri.parse("http://172.23.48.1/test/signin.php"),
        body: {
          "username" : user.text,
          "password" : pass.text,
        });
    var usres = json.decode(response.body);
    if(usres == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
    } else{
      Fluttertoast.showToast(
          msg: "Username & Password Incorrect!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover

        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text('Welcome to Site \n DUCMC', style: TextStyle(
                color: Colors.white, fontSize: 33
              ),),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5, left: 35, right: 35),
                child: Column(
                 children: [
                   TextField(
                     controller: user,
                     decoration: InputDecoration(
                       fillColor: Colors.grey.shade100,
                       filled: true,
                       hintText: 'Username',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)
                       )
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   TextField(
                     obscureText: true,
                     controller: pass,
                     decoration: InputDecoration(
                         fillColor: Colors.grey.shade100,
                         filled: true,
                         hintText: 'Password',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10)
                         )
                     ),
                   ),
                   SizedBox(
                     height: 40,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Sign In',
                          style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 27,
                              fontWeight: FontWeight.w700
                       ),),
                       CircleAvatar(
                         radius: 30,
                         backgroundColor: Color(0xff4c505b),
                         child: IconButton(
                           color: Colors.white,
                           onPressed: (){
                             login();
                           },
                           icon: Icon(Icons.arrow_forward),
                         ),
                       )
                     ],
                   ),
                   SizedBox(
                     height: 40,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       TextButton(
                         onPressed: () {
                           Navigator.pushNamed(context, 'register');
                         }, 
                         child: Text('Sign Up', style: TextStyle(
                         decoration: TextDecoration.underline,
                         fontSize: 18,
                         color: Color(0xff4c505b),
                       ),
                       )
                       ),
                       TextButton(onPressed: () {
                         Navigator.pushNamed(context, 'forgotpass');
                       }, child: Text('Forgot Password', style: TextStyle(
                         decoration: TextDecoration.underline,
                         fontSize: 18,
                         color: Color(0xff4c505b),
                       ),
                       )
                       )
                     ],
                   )
                 ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
