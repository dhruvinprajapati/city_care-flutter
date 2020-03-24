

import 'package:care_city/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatelessWidget {

  void _showPhotoSelectionOption(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 150,
        child: Column(children:<Widget>[
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text("take a picture"),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Select from photo library"),
          )
        ]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ReportIncidentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Report an Incident"),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Image.asset("images/1234.jpg"),
        FlatButton(
          child: Text("take Picture"),
          color: Colors.blue,
          onPressed: () {
            _showPhotoSelectionOption(context);
          },
        ),
        TextField(
          onChanged: (value) => vm.title = value,
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
          onPressed: () {
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
