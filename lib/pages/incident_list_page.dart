import 'package:care_city/pages/incident_report_page.dart';
import 'package:care_city/view_models/report_incident_view_model.dart';
import 'package:care_city/widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatelessWidget {
  Future<void> _navigateToReportIncidentPage(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (cintext) => ReportIncidentViewModel(),
                  child: IncidentReportPage(),
                ),
            fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("incidents"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          IncidentList(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _navigateToReportIncidentPage(context);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
