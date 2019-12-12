import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dnadetec/models/user_model.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
// Field
  List<UserModel> userModels = List();

// Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String url = 'http://infobizplus.com/DNA/getAllProduct.php';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);

    for (var map in result) {
      UserModel userModel = UserModel.fromJson(map);
      setState(() {
        userModels.add(userModel);
      });
    }
  }

  Widget showImage(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Image.network(userModels[index].avatar),
    );
  }
  Widget showText(int index){
    return Text(userModels[index].name);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการวิเคราะห์'),
      ),
      body: ListView.builder(
        itemCount: userModels.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              showImage(index),showText(index),
            ],
          );
        },
      ),
    );
  }
}
