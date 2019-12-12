
import 'package:dnadetec/models/user_model.dart';
import 'package:dnadetec/scaffold/register.dart';
import 'package:flutter/material.dart';

import 'MyService.dart';
import 'analysis.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
// Field
  String user, password;
  final formKey = GlobalKey<FormState>();
  UserModel userModel;

// Method

  Widget analysisButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.orange.shade900,
      child: Text(
        'วิเคราะห์ข้อมูล',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('วิเคราะห์ข้อมูล');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Analysis();
        });
        Navigator.of(context).push(materialPageRoute);
        
      },
    );
  }

  

 Widget reportButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.orange.shade900,
      child: Text(
        'ผลการวิเคราะห์',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('ผลการวิเคราะห์');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return MyService();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget userButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
       color: Colors.orange.shade900,
      child: Text(
        'ผู้ใช้',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('ผู้ใช้');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

 

 

 

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'DNA Detec',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.orange.shade900,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color.fromARGB(130, 255, 255, 255),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      showLogo(),
                      showAppName(),
                      SizedBox(
                        height: 8.0,
                      ),
                      analysisButton(),
                      reportButton(),
                      userButton(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
