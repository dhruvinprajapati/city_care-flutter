import 'dart:convert';

import 'package:care_city/models/incident.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class WebService{

  Future<void> saveIncident()async{
     var dio = new Dio();
    final url ="http://test.karbh.com/test";
    await dio.post(
      url,
      data: {"title":"Dhruvin","description":"prajapati"},
      options: Options(contentType:"application/x-www-from-urlencoded"),
      );
  //   await http.post(
  //     url,
  //     body: {"title":"Dhruvin","description":"prajapati"},
  //     headers: {
  //   'Content-type' : 'application/x-www-form-urlencoded'
  // },
  //     );

  }

}