import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';
import 'database.dart';

// dynamic widget that can be changed
class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // list of posts
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(addPost(post));
    setState(() {
      posts.add(post);
    });
  }

  void updatePosts() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePosts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HomePage")),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts, widget.user)),
          TextInputWidget(newPost)
        ]));
  }
}
