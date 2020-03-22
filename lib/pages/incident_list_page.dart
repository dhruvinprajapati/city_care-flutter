import 'package:care_city/widgets/incident_list.dart';
import 'package:flutter/material.dart';

class IncidentListPage extends StatelessWidget {
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
                  onPressed: null,
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
