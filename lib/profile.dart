import 'package:fem_in_need/contacts.dart';
import 'package:fem_in_need/employeelist.dart';
import 'package:fem_in_need/login.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //      RaisedButton(
        //        child: Text("Add"),
        //        onPressed: () => Navigator.push(
        //            context, MaterialPageRoute(builder: (context) => Contacts())),
        //      ),
        //      RaisedButton(
        //        child: Text("Display"),
        //        onPressed: () => Navigator.push(
        //            context, MaterialPageRoute(builder: (context) => MyEmployeeList())),
        //      ),
        SizedBox(
          height: 60,
        ),
        Text(
          "Profile",
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
        ListView(
          padding: EdgeInsets.only(left: 25, right: 25),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ButtonTheme(
              minWidth: 350,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: RaisedButton(
                child: Text(
                  "Test Name",
                  style: TextStyle(fontSize: 18),
                ),
                disabledColor: Colors.white,
                elevation: 4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              minWidth: 350,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: RaisedButton(
                child: Text(
                  "test@test.com",
                  style: TextStyle(fontSize: 18),
                ),
                disabledColor: Colors.white,
                elevation: 4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              minWidth: 350,
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: RaisedButton(
                child: Text(
                  "9999999999",
                  style: TextStyle(fontSize: 18),
                ),
                disabledColor: Colors.white,
                elevation: 4,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ButtonTheme(
              minWidth: 350,
              height: 45,
              child: RaisedButton(
                child: Text(
                  "View Trusted Contacts",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEmployeeList()),
                  );
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ButtonTheme(
              minWidth: 350,
              height: 45,
              child: RaisedButton(
                child: Text(
                  "Add Trusted Contacts",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contacts()),
                  );
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
              minWidth: 50,
              height: 60,
              child: RaisedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                color: Color.fromRGBO(1, 200, 83, 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
