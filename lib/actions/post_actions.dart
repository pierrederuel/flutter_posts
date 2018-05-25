import 'package:flutter_redux_boilerplate/models/post.dart';

class GetPostsRequest {
  final String url = "/posts";
  final Map<String, String> params;

  GetPostsRequest({this.params});

  @override
  String toString() {
    return 'Trying to get posts GetPostsRequest{params: $params}';
  }
}

class GetPostsSuccess {
  final List<Post> posts;

  GetPostsSuccess(this.posts);
}

class GetPostsFailure {
  final String error;

  GetPostsFailure(this.error);
}

class GetPostRequest {
  final String url = "/posts";
  final String id;
  final Map<String, String> params;

  GetPostRequest({this.id, this.params});

  @override
  String toString() {
    return 'Trying to get post GetPostRequest{params: $params}';
  }
}

class GetPostSuccess {
  final Post post;

  GetPostSuccess(this.post);
}

class GetPostFailure {
  final String error;

  GetPostFailure(this.error);
}
