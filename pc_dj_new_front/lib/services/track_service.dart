import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart' show MediaType;

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:pc_dj_new_front/models/track.dart';
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

  static getTracksBy({
    required String fieldName,
    required String fieldValue,
    int from = 0,
    int count = 7,
    String? sortFieldName,
    bool sortDesc = false,
  }) async {
    final response = await get(
      Uri.http(baseUrl, 'get_tracks_by/$fieldName/$fieldValue', {
        "from": from,
        "count": count,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    List<Track> trackList = [];
    for (final trackData in jsonDecode(response.body)) {
      trackList.add(Track(
        id: trackData.id,
        url: "$baseUrl/dev_file_storage/track_storage/${trackData.file_url}",
        description: trackData.title,
        title: trackData.author,
        coverUrl: trackData.cover ?? "default_cover.jpeg",
        yes: 1235,
        no: 244,
        plays: 16000,
      ));
    }

    // title: 'Inspection',
    // description: 'Leftfield',
    // url: 'assets/audio/default/tracks/Leftfield_-_Inspection__Hackers_2.mp3',
    // coverUrl: 'assets/images/default/covers/Leftfield_Inspection.jpg',
    // yes: 1234,
    // no: 234,
    // plays: 12000,
    return jsonDecode(response.body);
  }
}
