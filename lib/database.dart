import 'package:firebase_database/firebase_database.dart';

import 'Post.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference addPost(Post post) {
  var id = databaseReference.child('Posts/').push();
  id.set(post.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference id) {
  id.update(post.toJson());
}

Future<List<Post>> getAllPosts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('posts/').once();
  List<Post> posts = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Post post = createPost(value);
      post.setId(databaseReference.child('Posts/' + key));
      posts.add(post);
    });
  }
  return posts;
}


