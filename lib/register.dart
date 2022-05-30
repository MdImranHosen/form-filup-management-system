import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:select_form_field/select_form_field.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  TextEditingController nam = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pro = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register()async{

   var response = await http.post(
        Uri.parse("http://172.23.48.1/test/register.php"),
        body: {
          "name" : nam.text,
          "username" : user.text,
          "program" : pro.text,
          "password" : pass.text,
        });

    var data = json.decode(response.body);
    if(data == "Error") {
      Fluttertoast.showToast(
          msg: "This User Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    } else{
      Fluttertoast.showToast(
          msg: "Registration Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  /*
  String cprogram;
  String pmessage;
  bool perror;
  var pdata;

  List<String> cprograms = ["1","2","3"];

  String purl = "http://172.20.80.1/test/program.php";

  @override
  void initState(){
    perror = false;
    pmessage = "";
    cprogram = "1";
    super.initState();
  }

  Future<void> getProgram() async {
    var res = await http.post(
        Uri.parse(purl + "?cpro=" + Uri.encodeComponent(cprogram))
    );
    //attache countryname on parameter country in url
    if (res.statusCode == 200) {
      setState(() {
        pdata = json.decode(res.body);
        if(pdata["error"]){
          //check fi there is any error from server.
          perror = true;
          pmessage = pdata["errmsg"];
        }
      });
    }else{
      //there is error
      setState(() {
        perror = true;
        pmessage = "Error during fetching data";
      });
    }
  }

*/

  /*  Start C program Dropdown List  */

/*  String selectedName;
  List cdata = List();
  Future getAllName() async{
    var cresponse = await http.get("", headers: {"Accept":"application/json"});
    var jsonBody = cresponse.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      cdata = jsonData;
    });

    print(jsonData);
  }*/













  /*  End C program Dropdown List  */

  final List<Map<String, dynamic>> _items = [
    {
      'value': '1',
      'label': 'M.B.B.S.',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '2',
      'label': 'Basic B.Sc. in Nursing',
      'icon': Icon(Icons.stop),
    },
    {
      'value': '3',
      'label': 'B.D.S',
      'icon': Icon(Icons.stop),
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            controller: nam,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            controller: user,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),




                          SelectFormField(
                            controller: pro,
                            style: TextStyle(color: Colors.white),
                            type: SelectFormFieldType.dropdown, // or can be dialog
                            items: _items,
                            onChanged: (val) => print(val),
                            onSaved: (val) => print(val),
                            decoration: new InputDecoration(
                            labelText: 'Select Program',
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white,
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                             ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),




                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: pass,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      //Navigator.push(context, MaterialPageRoute(builder: builder))
                                      register();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
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
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}