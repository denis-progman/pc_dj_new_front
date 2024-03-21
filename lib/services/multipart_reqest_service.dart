import 'dart:async';

import 'package:http/http.dart';


class MultipartRequestService extends MultipartRequest {
  MultipartRequestService(
    String method,
    Uri url, {
    required this.onProgress,
  }) : super(method, url);

  final void Function(int bytes, int totalBytes) onProgress;

  @override
  ByteStream finalize() {
    final byteStream = super.finalize();
    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if(total >= bytes) {
           sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return ByteStream(stream);
  }
}