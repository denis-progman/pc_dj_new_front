import 'package:pc_dj_new_front/models/comment.dart';

class CommentStorage {

  static List<Comment> commentsByTrackId(int id) => trackComments[id].comments;

  static List<TrackComments> trackComments = [
    TrackComments(
      trackId: 0,
      comments: [
        Comment(
          name: "Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I love to code", 
          date: "2021-01-01 12:00:00"
        ),
        Comment(
          name: "2 Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I don't love to code", 
          date: "2021-01-01 12:00:00"
        ),
        Comment(
          name: "3 Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I really love to code", 
          date: "2021-01-01 12:00:00"
        ),
      ]
    ),
    TrackComments(
      trackId: 1,
      comments: [
        Comment(
          name: "Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I love to code", 
          date: "2021-01-01 12:00:00"
        ),
        Comment(
          name: "3 Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I really love to code", 
          date: "2021-01-01 12:00:00"
        ),
      ]
    ),
    TrackComments(
      trackId: 2,
      comments: [
        Comment(
          name: "Chuks Okwuenu", 
          avatarUrl: "assets/images/default/dj_avatar.png", 
          text: "I love to code", 
          date: "2021-01-01 12:00:00"
        ),
      ]
    ),
  ];
}
