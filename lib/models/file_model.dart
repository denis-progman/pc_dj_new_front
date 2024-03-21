import 'dart:convert';

List<FileModel> fileFromJson(String str) {
    final jsonData = json.decode(str);
    return List<FileModel>.from(jsonData.map((x) => FileModel.fromJson(x)));
}

String fileToJson(List<FileModel> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class FileModel {
    String fileName;
    DateTime dateModified;
    int size;

    FileModel({
        required this.fileName,
        required this.dateModified,
        required this.size,
    });

    factory FileModel.fromJson(Map<String, dynamic> json) {
      //print( "Datum: ${json["dateModified"]}");
      
      return new FileModel(
        fileName: json["fileName"],
        dateModified: DateTime.parse(json["dateModified"]),
        size: json["size"],
    );
    }

    Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "dateModified": dateModified,
        "size": size,
    };
}