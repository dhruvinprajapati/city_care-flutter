import 'package:flutter/material.dart';

class IncidentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Report an Incident"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          TextField(),
        ])
      ),
    );
  }
}