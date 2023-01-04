import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;
  PostList(this.listItems, this.user);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
            child: Row(children: <Widget>[
          Expanded(
              child: ListTile(
                  title: Text(post.body), subtitle: Text(post.author))),
          Row(children: <Widget>[
            Container(
              child: Text(post.usersliked.length.toString(),
                  style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            IconButton(
              onPressed: () => like(()=>post.likePost(widget.user)),
              icon: Icon(Icons.thumb_up),
              color: post.usersliked.contains(widget.user.uid) ? Colors.green : Colors.black,
            )
          ])
        ]));
      },
    );
  }
}
