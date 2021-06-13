import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String username;

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  String msg = "";

  Future _login() async {
    final response = await http.post(
        Uri.parse("https://192.168.0.108/api_futsal/login.php"),
        body: {"username": user.text, "password": pass.text});

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "username atau Password Salah";
      });
    } else {
      Navigator.pushReplacementNamed(context, '/Home');
      setState(() {});
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Aplikasi Kasir Booking Futsal',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: pass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text(''),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        _login();
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(msg),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
