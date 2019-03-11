import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  void _sendSMS(String contacts) {
    var uri = "sms:$contacts?";
    _launch(uri);
  }

  void _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  List<String> contact;
  DateTime date;
  String fromplace;
  String toplace;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Text(
          "Send My Trip Details",
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
        Form(
          child: Theme(
            data: ThemeData(
                inputDecorationTheme:
                    InputDecorationTheme(labelStyle: TextStyle(fontSize: 15))),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 25, right: 25),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "From Place",
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value.isEmpty ? 'From Place can\'t be empty' : null,
                  onSaved: (value) => fromplace = value,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "To Place",
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'To place can\'t be empty' : null,
                  onSaved: (value) => toplace = value,
                ),
                SizedBox(
                  height: 40,
                ),
                DateTimePickerFormField(
                  inputType: InputType.date,
                  format: DateFormat('dd-MM-yyyy'),
                  onChanged: (dt) => setState(() => date = dt),
                  decoration: InputDecoration(
                    labelText: "Date",
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                DateTimePickerFormField(
                  inputType: InputType.time,
                  format: DateFormat('HH:mm'),
                  decoration: InputDecoration(
                    labelText: "Time",
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  onChanged: (dt) => setState(() => date = dt),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Vehicle Number",
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
                ButtonTheme(
                  minWidth: 280,
                  height: 60,
                  child: RaisedButton(
                    child: Text(
                      "Send",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    color: Color.fromRGBO(1, 200, 83, 1),
                    onPressed: () {
                      _sendSMS("8825274063,8094696587,8762582648");
                    },
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
