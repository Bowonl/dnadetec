import 'dart:io';

class DetailModel {

// Field
String no, name, place, disease, detail, temp, timer, date, 	result, check, imgDNA;

// Method
DetailModel(this.no, this.name, this.place, this.disease, this.	detail, this.temp, this.timer, 
this.date, this.	result, this.check, this.imgDNA);

DetailModel.fromJson(Map<String, dynamic>map){
  no = map['no'];
  name = map['name'];
  place = map['place'];
  disease = map['disease'];
  detail = map['detail'];
  temp = map['temp'];
  timer = map['timer'];
  date = map['date'];
  result = map['result'];
  check = map['check'];
  imgDNA = map['imgDNA'];
}

  
}