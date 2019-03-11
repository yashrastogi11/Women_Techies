import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Panic extends StatefulWidget {
  @override
  _PanicState createState() => _PanicState();
}

class _PanicState extends State<Panic> {


  void _sendSMS() {
    const message = "Hello";
    const uri = "sms:8825274063,8094696587 ? body = $message";
    _launch(uri);
  }
  

  void _showTelephone() {
    _launch('tel:181');
  }

  void _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  void _launchUrl() async {
    var url =
        'https://www.google.com/maps/search/nearby+police+stations/@12.9620217,79.1222706,12z';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch nearby Police Stations';
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Text(
          "Panic Button",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(10, 107, 155, 1),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Text(
            "Panic? Press the \'Alert\' Button to inform your close contacts by sending your location along.",
            style: TextStyle(fontSize: 22, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 80),
        ButtonTheme(
          minWidth: 350,
          height: 60,
          child: RaisedButton(
            child: Text(
              "Alert",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            color: Color.fromRGBO(249, 78, 78, 1),
            onPressed: _sendSMS,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
        ),
        SizedBox(height: 40),
        ButtonTheme(
          minWidth: 280,
          height: 60,
          child: RaisedButton(
            child: Text(
              "Police Stations",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            color: Color.fromRGBO(1, 200, 83, 1),
            onPressed: _launchUrl,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ButtonTheme(
          minWidth: 210,
          height: 60,
          child: RaisedButton(
            child: Text(
              "Women Helpline",
              style: TextStyle(
                fontSize: 28,
                color: Color.fromRGBO(10, 107, 155, 1),
                fontWeight: FontWeight.w900,
              ),
            ),
            color: Colors.white,
            onPressed: _showTelephone,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
        ),
      ],
    );
  }
}
