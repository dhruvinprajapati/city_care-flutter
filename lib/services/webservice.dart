import 'dart:convert';
import 'dart:io';

import 'package:care_city/models/incident.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class WebService {
  var dio = new Dio();
  Future<void> saveIncident(Incident incident) async {

    File file = File(incident.imageURL);
    final filename = basename(file.path.replaceAll(" ",""));
    debugPrint(filename+incident.imageURL);
    final url = "http://test.karbh.com/test";
    FormData form =
        FormData.fromMap({
          "title": incident.title, 
          "description": incident.description,
          "file" : await MultipartFile.fromFile(incident.imageURL,filename: filename)
          });
    
       await dio.post(
        url,
        data: form).then((response) => print(response))
  .catchError((error) => print(error));
    //   await http.post(
    //     url,
    //     body: {"title":"Dhruvin","description":"prajapati"},
    //     headers: {
    //   'Content-type' : 'application/x-www-form-urlencoded'
    // },
    //     );
  }

  Future<List<Incident>> getAllIncident() async{
    final url = "http://test.karbh.com/test";
    final response = await dio.get(url);
    if(response.statusCode == 200){
      final Iterable json = response.data;
      return json.map((incident)=>Incident.fromJson(incident)).toList();
    } else{
      throw Exception("Unable to get incident");
    }
  }

}
