import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aplikasi_booking_futsal/screens/home.dart';
import 'package:aplikasi_booking_futsal/screens/data_booking.dart';
import 'logout.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[Home(), LogoutPage()];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.logout), title: Text("Logout")),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
