class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({this.id, this.userId, this.title, this.body});

  Map<String, dynamic> toJSON() => <String, dynamic>{
        'id': this.id,
        'userId': this.userId,
        'title': this.title,
        'body': this.body
      };

  factory Post.fromJSON(Map<dynamic, dynamic> json) => new Post(
        id: json['id'] as int,
        userId: json['userId'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );

  @override
  String toString() {
    return '{id: $id, userId: $userId, title:$title, body: $body}';
  }
}
