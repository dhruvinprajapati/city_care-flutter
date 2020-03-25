import 'package:care_city/models/incident.dart';
import 'package:care_city/services/webservice.dart';
import 'package:flutter/material.dart';

class ReportIncidentViewModel extends ChangeNotifier{

  String title;
  String description;
  String imagePath;

  Future<void> saveIncident() async{
    
    final incident = Incident(title:title,description: description,imageURL: imagePath);
    await WebService().saveIncident(incident);

  }

}