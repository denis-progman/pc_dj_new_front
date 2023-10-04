import 'dart:io';
import 'package:http_parser/http_parser.dart' show MediaType;

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:pc_dj_new_front/services/multipart_reqest_service.dart';

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

class TrackService {
  static String baseUrl = '127.0.0.1:5001';

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
    request.files.add(await MultipartFile.fromPath(
      "track",
      file.path,
      filename: basename(file.path),
      contentType: MediaType('application', 'mp3'),
    ));
    final streamedResponse = await request.send();
    return streamedResponse.toString();
  }
}
