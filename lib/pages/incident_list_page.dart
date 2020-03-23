import 'package:care_city/pages/incident_report_page.dart';
import 'package:care_city/view_models/incident_list_view_model.dart';
import 'package:care_city/view_models/report_incident_view_model.dart';
import 'package:care_city/widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPageState createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  @override
  void initState() {
    super.initState();
    _populateAllIncidentPage();
  }

  Future<void> _populateAllIncidentPage() {
    Provider.of<IncidentListViewModel>(context, listen: false).getAllIncident();
  }

  Future<void> _navigateToReportIncidentPage(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (cintext) => ReportIncidentViewModel(),
                  child: IncidentReportPage(),
                ),
            fullscreenDialog: true));
    _populateAllIncidentPage();
  }

  Widget _updateUI(IncidentListViewModel vm) {
    switch (vm.status) {
      case Status.loading:
        return Align(
          child: CircularProgressIndicator(),
        );
      case Status.empty:
        return Text("No Incident found");
      case Status.success:
        return IncidentList(incidents: vm.incident);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<IncidentListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("incidents"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          _updateUI(vm),
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
