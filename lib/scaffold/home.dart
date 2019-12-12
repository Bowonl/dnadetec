import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dnadetec/models/user_model.dart';
import 'package:dnadetec/scaffold/menu.dart';
import 'package:dnadetec/scaffold/register.dart';
import 'package:dnadetec/utility/normal_dialog.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Field
  String user, password;
  final formKey = GlobalKey<FormState>();
  UserModel userModel;

// Method

  Widget signInButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.orange.shade900,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        formKey.currentState.save();
        print('user = $user,password = $password');

        if (user.isEmpty || password.isEmpty) {
          normalDialog(context, 'มีช่องว่าง', 'กรุณากรอกข้อมูล');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    String url =
        'http://infobizplus.com/DNA/getUser.php?isAdd=true&User=$user';

    Response response = await Dio().get(url);
    print('response = $response');

    var result = json.decode(response.data);
    print('result = $result');

    if (response.toString() == 'null') {
      normalDialog(context, 'User False', 'No $user in my Database');
    } else {
      for (var map in result) {
        userModel = UserModel.fromJson(map);
      }

      if (password == userModel.password) {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) {
          return Menu();
        });
        Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
            (Route<dynamic> route) {
          return false;
        });
      } else {
        normalDialog(
            context, 'Password False', 'Please Try agsins Password False');
      }
    }
  }

  Widget signUpButton() {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text('Sign Up'),
      onPressed: () {
        print('Sign Up');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 5.0,
        ),
        signUpButton(),
      ],
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          user = string.trim();
        },
        decoration: InputDecoration(labelText: 'User :'),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          password = string;
        },
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password :'),
      ),
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
                      userForm(),
                      passwordForm(),
                      SizedBox(
                        height: 8.0,
                      ),
                      showButton(),
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
