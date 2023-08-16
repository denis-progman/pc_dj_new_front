class TrackComments {
  final int trackId;
  final List<Comment> comments;
  
  TrackComments({
    required this.trackId,
    required this.comments,
  });
}

class Comment {
  final String name;
  final String avatarUrl;
  final String text;
  final String date;

  Comment({
    required this.name,
    required this.avatarUrl,
    required this.text,
    required this.date,
  });
}
