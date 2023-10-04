import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_dj_new_front/services/track_service.dart';
import 'package:pc_dj_new_front/styles/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:pc_dj_new_front/widgets/components/user_cabinet/track_upload_form.dart';
import 'package:path/path.dart' as p;

class FileUploadButton extends StatefulWidget {
  final String title;
  const FileUploadButton(this.title, {super.key});

  @override
  State<FileUploadButton> createState() => _FileUploadButtonState();
}

class _FileUploadButtonState extends State<FileUploadButton> {
  late File _file;
  late Map<String, String>? _formData;
  double _progressValue = 0;
  int _progressPercentValue = 0;

  Future<File?> _chooseFile() async {
    FilePickerResult? pickedFiles =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (pickedFiles != null) {
      String? filePath = pickedFiles.files.single.path;
      if (filePath != null) {
        _file = File(filePath);
        return _file;
      }
    }
    return null;
  }

  void _uploadFile(BuildContext context) async {
    try {
      File? file = await _chooseFile();
      if (file == null) {
        _showSnackBar(context, "Select file first");
        return;
      }
      TrackUploadForm form = TrackUploadForm(
        fileName: p.basename(file.path),
        onSubmitCallback: (formData) => _formData = formData
      );
      
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return form;
      });

      if (_formData == null) {
        _showSnackBar(context, "Icorrected form filling, action is canceled!");
        return;
      }
      _setUploadProgress(0, 0);
      await TrackService.trackUpload(
        file: file,
        onUploadProgress: _setUploadProgress,
        requestFields: _formData!,
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
    return Column(
      children: [
        _progressPercentValue != 100 && _progressPercentValue != 0
            ? _buildUploadView()
            : TextButton(
                onPressed: () => {_uploadFile(context)},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 16),
                  backgroundColor: AppColors.secondBrand.withOpacity(0.6),
                ),
                child: Text(widget.title),
              )
      ],
    );
  }
}
