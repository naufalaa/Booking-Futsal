import 'package:aplikasi_booking_futsal/screens/data_booking.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_booking_futsal/screens/editData.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;

  int index;

  Detail({this.index, this.list});

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.0.108/api_futsal/deletedata.php";

    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah akan menghapus data ${widget.list[widget.index]['nama_tim']} ?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Ya!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();

            Navigator.pushReplacementNamed(context, '/Home');
          },
        ),
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nama_tim']}")),
      body: new Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  "Nama Tim",
                  textAlign: TextAlign.left,
                ),
                new Text(
                  widget.list[widget.index]['nama_tim'],
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.start,
                ),
                new Text(
                  "Lapangan : ${widget.list[widget.index]['lapangan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tgl Booking : ${widget.list[widget.index]['lapangan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Lapangan : ${widget.list[widget.index]['lapangan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Waktu Mulai : ${widget.list[widget.index]['waktu_mulai']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Waktu Selesai : ${widget.list[widget.index]['waktu_selesai']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    new RaisedButton(
                      child: new Text("HAPUS"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
