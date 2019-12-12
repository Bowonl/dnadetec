
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
// Field
  File file;
  String name, place, disease, detail, temp, timer;
  final formKey = GlobalKey<FormState>();
  String nameImage;

   



// Method

  Widget nameForm() {
    Color color = Colors.purple;
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          name = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.assignment,
            size: 36.0,
            color: color,
          ),
          labelText: 'ชื่องาน :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรุณากรอกชื่องาน',
          helperStyle: TextStyle(color: color),          
        ),
      ),
    );
  }

  
  Widget placeForm() {
    Color color = Colors.brown.shade400;
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          place = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.place,
            size: 36.0,
            color: color,
          ),
          labelText: 'สถานที่ :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรุณากรอกสถานที่',
          helperStyle: TextStyle(color: color),          
        ),
      ),
    );
  }

  
  Widget diseaseForm() {
    Color color = Colors.pinkAccent.shade400;
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          disease = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.enhanced_encryption,
            size: 36.0,
            color: color,
          ),
          labelText: 'เชื้อ :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรุณากรอกประเภทเชื้อ',
          helperStyle: TextStyle(color: color),          
        ),
      ),
    );
  }

  Widget detailForm() {
    Color color = Colors.green;
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          detail = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.library_books,
            size: 36.0,
            color: color,
          ),
          labelText: 'รายละเอียดงาน :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรณากรอกรายละเอียดงาน',
          helperStyle: TextStyle(color: color),
        ),
      ),
    );
  }

  Widget tempForm() {
    Color color = Colors.blue;
    return Container(
      width: 250.0,
      child: TextFormField(
        onSaved: (String string) {
          temp = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.wb_sunny,
            size: 36.0,
            color: color,
          ),
          labelText: 'อุณหภูมิ :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรณากรอกอุณหภูมิ',
          helperStyle: TextStyle(color: color),
        ),
      ),
    );
  }

   Widget timerForm() {
    Color color = Colors.indigo;
    return Container(
      width: 250.0,
      
      child: TextFormField(
        onSaved: (String string) {
          timer = string.trim();
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.update,
            size: 36.0,
            color: color,
          ),
          labelText: 'เวลา :',
          labelStyle: TextStyle(color: color),
          helperText: 'กรณากรอกเวลา',
          helperStyle: TextStyle(color: color),
          
        ),
      ),
    );
  }

  

  

  

 

  Widget analysisButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        formKey.currentState.save();
        uploadMySQL();
        
      },
    );
  }

 

  Future<void> uploadMySQL() async {

   

    String url = 'http://infobizplus.com/DNA/addAnalytic.php?isAdd=true&Name=$name&Place=$place&Disease=$disease&Detail=$detail&Temp=$temp&Timer=$timer';

    Response response = await Dio().get(url);
    print('response = $response');

    Navigator.of(context).pop();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[analysisButton()],
        title: Text('งานตรวจสอบ'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameForm(),
            placeForm(),
            diseaseForm(),
            detailForm(),
            tempForm(),
            timerForm(),
            
          ],
        ),
      ),
    );
  }
}
