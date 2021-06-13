import 'package:aplikasi_booking_futsal/screens/data_booking.dart';
import 'package:aplikasi_booking_futsal/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aplikasi_booking_futsal/util/data.dart';
import 'package:aplikasi_booking_futsal/widgets/badge.dart';
import 'package:aplikasi_booking_futsal/widgets/product_item.dart';
import 'package:aplikasi_booking_futsal/widgets/room_item.dart';
import 'package:aplikasi_booking_futsal/widgets/search_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              "Aplikasi Kasir Booking Futsal",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 30.0),
          buildRoomList(),
          SizedBox(height: 20.0),
          // buildTitleRow(),
          buildProductList(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  buildRoomList() {
    return Container(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];

          return RoomItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Gambar Lainnya",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  buildProductList() {
    return Center(
        child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DataBooking(),
              ));
            },
            child: Text(
              "Cek Data Booking",
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            )));
  }
}
