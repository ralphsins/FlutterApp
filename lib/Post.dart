import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'database.dart';

class Post {
  String body;
  String author;
  // set of users that liked a post
  //  we used a set because it have a lot of method that
  // facilitate adding and removing users
  Set usersliked = {};
  DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    if (usersliked.contains(user.uid)) {
      this.usersliked.remove(user.uid);
    } else {
      this.usersliked.add(user.uid);
    }
    this.update();
  }

  void update() {
    updatePost(this, this._id);
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {'author': author, 'usersliked': usersliked.toList(), 'body': body};
  }

}
  Post createPost(record) {
  Map<String, dynamic> attributes = {
    'author': '',
    'usersliked': [],
    'body': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  Post post = new Post(attributes['body'], attributes['author']);
  post.usersliked = new Set.from(attributes['usersliked']);
  return post;
}

