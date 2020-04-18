import 'package:care_city/pages/incident_list_page.dart';
import 'package:care_city/view_models/incident_list_view_model.dart';
import 'package:care_city/view_models/incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => IncidentListViewModel(),
        child: IncidentListPage(),
        ),
    );
  }
}