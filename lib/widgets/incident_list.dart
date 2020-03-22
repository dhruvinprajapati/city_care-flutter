import 'package:flutter/material.dart';

class IncidentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return ListTile(
          title: Text("Item $index"),
        );
      },
    );
  }
}