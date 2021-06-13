import 'dart:convert';
import 'addData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'detail.dart';

class DataBooking extends StatefulWidget {
  @override
  _DataBookingState createState() => _DataBookingState();
}

class _DataBookingState extends State<DataBooking> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.0.108/api_futsal/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Data Booking"),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.green,
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama_tim']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text(
                    "Lapangan ${list[i]['lapangan']}, Jam ${list[i]['waktu_mulai']}, ${list[i]['tgl_booking']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
