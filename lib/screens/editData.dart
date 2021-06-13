import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:aplikasi_booking_futsal/screens/data_booking.dart';

class EditData extends StatefulWidget {
  final List list;

  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNamaTim;

  TextEditingController controllerLapangan;

  TextEditingController controllerTglBooking;

  TextEditingController controllerWaktuMulai;

  TextEditingController controllerWaktuSelesai;

  void editData() {
    var url = "http://192.168.0.108/api_futsal/editdata.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "nama_tim": controllerNamaTim.text,
      "lapangan": controllerLapangan.text,
      "tgl_booking": controllerTglBooking.text,
      "waktu_mulai": controllerWaktuMulai.text,
      "waktu_selesai": controllerWaktuSelesai.text,
    });
  }

  @override
  void initState() {
    controllerNamaTim =
        new TextEditingController(text: widget.list[widget.index]['nama_tim']);

    controllerLapangan =
        new TextEditingController(text: widget.list[widget.index]['lapangan']);

    controllerTglBooking = new TextEditingController(
        text: widget.list[widget.index]['tgl_booking']);

    controllerWaktuMulai = new TextEditingController(
        text: widget.list[widget.index]['waktu_mulai']);

    controllerWaktuSelesai = new TextEditingController(
        text: widget.list[widget.index]['waktu_selesai`']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNamaTim,
                  decoration: new InputDecoration(
                      hintText: "Nama Tim", labelText: "Nama Tim"),
                ),
                new TextField(
                  controller: controllerLapangan,
                  decoration: new InputDecoration(
                      hintText: "Lapangan", labelText: "Lapangan"),
                ),
                new TextField(
                  controller: controllerTglBooking,
                  decoration: new InputDecoration(
                      hintText: "Tgl Booking", labelText: "Tgl Booking"),
                ),
                new TextField(
                  controller: controllerWaktuMulai,
                  decoration: new InputDecoration(
                      hintText: "Waktu Mulai", labelText: "Waktu Mulai"),
                ),
                new TextField(
                  controller: controllerWaktuSelesai,
                  decoration: new InputDecoration(
                      hintText: "Waktu Selesai", labelText: "Waktu Selesai"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
