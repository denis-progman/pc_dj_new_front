import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_dj_new_front/services/track_service.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:pc_dj_new_front/widgets/components/user_cabinet/track_upload_form.dart';

class FileUploadButton extends StatefulWidget {
  final String title;
  const FileUploadButton(this.title, {super.key});

  @override
  State<FileUploadButton> createState() => _FileUploadButtonState();
}

class _FileUploadButtonState extends State<FileUploadButton> {
  late File _file;
  double _progressValue = 0;
  int _progressPercentValue = 0;

  void _chooseFile(context) async {
    FilePickerResult? pickedFiles =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (pickedFiles != null) {
      String? filePath = pickedFiles.files.single.path;
      if (filePath != null) {
        _file = File(filePath);
        _uploadFile(context, _file);
        print(_file.path);
      }
    }
  }

  void _uploadFile(BuildContext context, File file) async {
    if (file == null) {
      _showSnackBar(context, "Select file first");
      return;
    }

    _setUploadProgress(0, 0);

    try {
      TrackUploadForm form = TrackUploadForm();

      await TrackService.trackUpload(
        file: file, 
        onUploadProgress: _setUploadProgress,
        requestFields: form.formData
      );

      _showSnackBar(context, "File uploaded - ${file.path}");
    } catch (e) {
      e.printInfo();
      _showSnackBar(context, e.toString());
    }
  }

  static double remap(
      double value,
      double originalMinValue,
      double originalMaxValue,
      double translatedMinValue,
      double translatedMaxValue) {
    if (originalMaxValue - originalMinValue == 0) return 0;

    return (value - originalMinValue) /
            (originalMaxValue - originalMinValue) *
            (translatedMaxValue - translatedMinValue) +
        translatedMinValue;
  }

  void _setUploadProgress(int sentBytes, int totalBytes) {
    double __progressValue =
        remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    __progressValue = double.parse(__progressValue.toStringAsFixed(2));

    if (__progressValue != _progressValue)
      setState(() {
        _progressValue = __progressValue;
        _progressPercentValue = (_progressValue * 100.0).toInt();
        print(_progressPercentValue);
      });
  }

  _showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildUploadView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          new Container(
              padding: EdgeInsets.only(top: 10),
              child: new Column(children: <Widget>[
                Text(
                  '$_progressPercentValue %',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ])),
          Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: LinearProgressIndicator(value: _progressValue)),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return _progressPercentValue != 100 && _progressPercentValue != 0 ? _buildUploadView() : TextButton(
      onPressed: () => {_chooseFile(context)},
      style: TextButton.styleFrom(
        minimumSize: const Size(100, 16),
        backgroundColor: AppColors.secondBrand.withOpacity(0.6),
      ),
      child: Text(widget.title),
    );
  }
}
