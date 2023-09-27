import 'package:flutter/material.dart';
import 'dart:io';

import 'package:pc_dj_new_front/widgets/components/select_input.dart';

typedef void SendTrackFormCallback(
  String title,
  String author,
  String stileID,
  File track,
);

class TrackUploadForm extends StatefulWidget {
  TrackUploadForm({super.key});

  @override
  State<TrackUploadForm> createState() => _TrackUploadFormState();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController styleController = TextEditingController();

  Map<String, String> get formData => {
    "title": titleController.value.toString(),
    "author": authorController.value.toString(),
    "style_id": styleController.value.toString(),
  };
}

class _TrackUploadFormState extends State<TrackUploadForm> {
  String? stileID = null;
  File? track = null;
  final Map<String, String> styles = {
    "1": "club",
    "2": "trance",
    "3": "techno",
    "4": "dnb",
    "5": "house"
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact Us'),
      content: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            controller: widget.titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextFormField(
            controller: widget.authorController,
            decoration: InputDecoration(hintText: 'Author'),
          ),
          SelectInput(
            styles, 
            currentValue: "1",
            label: "Music style",
            fieldController: widget.styleController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => (), // widget.sendAction(),
          child: Text('Send'),
        ),
      ],
    );
  }
}
