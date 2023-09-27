import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:http_parser/http_parser.dart' show MediaType;

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:pc_dj_new_front/services/multipart_reqest_service.dart';
import 'package:pc_dj_new_front/widgets/components/user_cabinet/track_upload_form.dart';

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

class TrackService {
  static String baseUrl = '127.0.0.1:5001';

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final List<String> styles = ["club", "trance", "techno", "dnb", "house"];
  String? dropdownValue = null;
  final TextEditingController styleController = TextEditingController();

  static showUploadForm() {}

  static trackUpload({
    required File file,
    required OnUploadProgressCallback onUploadProgress,
    required Map<String, String> requestFields,
  }) async {
    final request = MultipartRequestService(
      'POST',
      Uri.http(baseUrl, 'upload_track'),
      onProgress: onUploadProgress,
    );

    requestFields.forEach((key, value) => request.fields[key] = value);
    request.fields['user_id'] = "2";
    // request.files.add(await MultipartFile.fromPath(
    //   "track",
    //   file.path,
    //   filename: basename(file.path),
    //   contentType: MediaType('application', 'mp3'),
    // ));
    final streamedResponse = await request.send();
    return streamedResponse.toString();
  }

  void showDialogWithFields(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Track attributes'),
          content: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(hintText: 'Author'),
              ),
              DropdownMenu<String>(
                initialSelection: styles.first,
                onSelected: (String? value) {
                  dropdownValue = value;
                },
                dropdownMenuEntries:
                    styles.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }
}
