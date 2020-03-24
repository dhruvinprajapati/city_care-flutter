

import 'dart:io';

import 'package:care_city/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatefulWidget {
  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {

  ReportIncidentViewModel _reportIncidentViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reportIncidentViewModel = Provider.of<ReportIncidentViewModel>(context,listen:false);
  }

  void _showPhotoAlbum()async{
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _reportIncidentViewModel.imagePath = image.path;
    });

    
  }

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
            onTap: (){
              Navigator.of(context).pop();
              _showPhotoAlbum();
            },
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
        
        vm.imagePath == null ? Image.asset("images/1234.jpg") : Image.file(File(vm.imagePath)),

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
