import 'package:fem_in_need/home_page.dart';
import 'package:fem_in_need/intro_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        //    mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()),);
                },
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Step into a Safe World",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(height: 100),
          Form(
            child: Theme(
              data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(fontSize: 15))),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 25, right: 25),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) => email = value,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    obscureText: false,
                    validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                    onSaved: (value) => password = value,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonTheme(
                    height: 45,
                    minWidth: 350,
                    child: RaisedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      },
                 //     onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false), 
                        
           //             if (email == "test@test.com" && password == "test123")
        
            //              Navigator.pop(context);
                     //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                      
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
