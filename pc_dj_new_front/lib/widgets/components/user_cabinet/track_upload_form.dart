import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pc_dj_new_front/widgets/components/select_input.dart';

typedef void SendTrackFormCallback(
  String title,
  String author,
  String stileID,
  File track,
);

class TrackUploadForm extends StatelessWidget {
  final String fileName;
  final Function(Map<String, String>?) onSubmitCallback;
  TrackUploadForm(
      {required this.onSubmitCallback, required this.fileName, super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController styleController = TextEditingController();

  Map<String, String> get formData => {
        "title": titleController.text,
        "author": authorController.text,
        "style_id": styleController.text,
      };

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
      title: Text(
        fileName,
        style: TextStyle(color: Colors.black),
      ),
      content: Column(
        // shrinkWrap: true,
        children: [
          Text('Contact Us'),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextFormField(
            controller: authorController,
            decoration: InputDecoration(hintText: 'Author'),
          ),
          SelectInput(
            styles,
            currentValue: "1",
            label: "Music style",
            onSelectedCallback: (v) => styleController.text = v,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onSubmitCallback(null);
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onSubmitCallback(formData);
            Navigator.pop(context);
          },
          child: Text('Send'),
        ),
      ],
    );
  }
}
