import 'package:flutter/material.dart';
import 'data_booking.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNamaTim = TextEditingController();

  TextEditingController controllerLapangan = TextEditingController();

  TextEditingController controllerTglBooking = TextEditingController();

  TextEditingController controllerWaktuMulai = TextEditingController();

  TextEditingController controllerWaktuSelesai = TextEditingController();

  void addData() {
    var url = "http://192.168.0.108/api_futsal/adddata.php";

    http.post(Uri.parse(url), body: {
      "nama_tim": controllerNamaTim.text,
      "lapangan": controllerLapangan.text,
      "tgl_booking": controllerTglBooking.text,
      "waktu_mulai": controllerWaktuMulai.text,
      "waktu_selesai": controllerWaktuSelesai.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data"),
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
                  child: new Text("Tambah Data"),
                  color: Colors.green,
                  onPressed: () {
                    addData();
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
