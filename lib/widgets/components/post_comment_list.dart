import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/comment.dart';

class PostCommentList extends StatelessWidget {
  const PostCommentList(this.comments, {super.key});
    final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(children: [
      for (var i = 0; i < comments.length; i++)
      Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                // Display the image in large form.
                print("Comment Clicked");
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage("assets/images/default/dj_avatar.png"),
                ),
              ),
            ),
            title: Text(
              comments[i].name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(comments[i].text,
                style: TextStyle(color: Colors.black)),
            trailing: Text(comments[i].date,
                style: TextStyle(fontSize: 10, color: Colors.black)),
          )),
    ]));
  }
}

