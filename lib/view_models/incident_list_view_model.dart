import 'package:care_city/services/webservice.dart';
import 'package:care_city/view_models/incident_view_model.dart';
import 'package:flutter/material.dart';

enum Status {
  loading,empty,success
}


class IncidentListViewModel extends ChangeNotifier{

  List<IncidentViewModel> incident = List<IncidentViewModel>();
  Status status = Status.loading;
  Future<void> getAllIncident()async{
    final result = await WebService().getAllIncident();
    incident = result.map((incident)=>IncidentViewModel(incident: incident)).toList();
    status = incident.isEmpty ? Status.empty : Status.success;
    notifyListeners();
  }
}