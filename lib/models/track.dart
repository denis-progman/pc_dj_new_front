class Track {
  final int id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final int yes;
  final int no;
  final int plays;

  int get rating => (yes * 100 / (yes + no)).round();

  Track(
      {required this.id,
      required this.title,
      required this.description,
      required this.url,
      required this.coverUrl,
      required this.yes,
      required this.no,
      required this.plays});
}
