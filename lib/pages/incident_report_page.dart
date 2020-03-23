import 'package:care_city/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final vm = Provider.of<ReportIncidentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Report an Incident"),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        TextField(
          onChanged: (value)=>vm.title = value,
          decoration: InputDecoration(
              labelText: "Enter title",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        TextField(
          onChanged: (value) => vm.description = value,
          textInputAction: TextInputAction.done,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(labelText: "Enter Description"),
        ),
        FlatButton(
          onPressed: (){
            vm.saveIncident();
            Navigator.pop(context);
          },
          child: Text("save"),
          color: Colors.green,
        )
      ])),
    );
  }
}
