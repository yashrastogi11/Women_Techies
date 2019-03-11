import 'package:fem_in_need/database.dart';
import 'package:fem_in_need/employee.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  String name;
  String mobileNo;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add Trusted Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Name', labelStyle: TextStyle(fontSize: 20)),
                validator: (val) => val.length == 0 ? "Enter Name" : null,
                onSaved: (val) => this.name = val,
              ),
              SizedBox(
                height: 30,
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Mobile Number', labelStyle: TextStyle(fontSize: 20)),
                validator: (val) =>
                    val.length == 0 ? 'Enter Mobile Number' : null,
                onSaved: (val) => this.mobileNo = val,
              ),
              SizedBox(height: 40,),
              ButtonTheme(
                minWidth: 150,
                height: 60,
                child: RaisedButton(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  color: Color.fromRGBO(1, 200, 83, 1),
                  onPressed: _submit,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    }
    var employee = Employee(name, mobileNo);
    var dbHelper = DBHelper();
    dbHelper.saveEmployee(employee);
    Flushbar()
      ..message = "Saved Successfully"
      ..duration = Duration(seconds: 4)
      ..show(context);
  }
}
