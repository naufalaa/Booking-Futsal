import 'package:aplikasi_booking_futsal/screens/home.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

String username;

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                new Text("Anda yakin ingin keluar?"),
                new RaisedButton(
                  child: new Text(
                    "Ya",
                    style: new TextStyle(color: Colors.black),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Login');
                  },
                ),
              ],
            )));
  }
}
