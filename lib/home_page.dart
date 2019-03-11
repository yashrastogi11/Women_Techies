import 'package:fem_in_need/panic.dart';
import 'package:fem_in_need/profile.dart';
import 'package:fem_in_need/trip.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int opened = 1;
  int currentPage = 1;
  final List<Widget> _children = [
    Trip(),
    Panic(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you really want to exit the app?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () => SystemNavigator.pop(),
             //     onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
          initialSelection: 1,
          tabs: [
            TabData(iconData: Icons.message, title: "Trip Details"),
            TabData(iconData: Icons.add_alert, title: "Alert"),
            TabData(iconData: Icons.person, title: "Profile"),
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
        body: _children[currentPage],
      ),
    );
  }
}
