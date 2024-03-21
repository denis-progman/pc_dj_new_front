import 'package:flutter/material.dart';
import 'package:pc_dj_new_front/models/comment.dart';
import 'package:pc_dj_new_front/widgets/components/post_comment_list.dart';

class PostCommentBox extends StatelessWidget {
  PostCommentBox(this.comments, {super.key});

  final TextEditingController _controller = TextEditingController();

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: PostCommentList(comments),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Your comment",
              ),
              controller: _controller,
              minLines: 2,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            )),
      ]),
    );
  }
}
