import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class PostScreen extends StatelessWidget {
  final int postId;
  final Post post;

  PostScreen({@required this.postId, this.post}) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Récupération d\'un post'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return new Column(
      children: <Widget>[
        new Hero(
          tag: post.id.toString(),
          child: new Image.network(
              "https://www.brinkxl.nl/dbimg/news/wijziging-bezoek--en-postadres-brink-xl/item_110.jpg"),
        ),
        new Center(
          child: new FutureBuilder<Post>(
            future: fetchPost(postId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Column(
                  children: <Widget>[
                    new Text(
                      snapshot.data.title,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    new Text(snapshot.data.body),
                  ],
                );
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        )
      ],
    );
  }
}

Future<Post> fetchPost(postId) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/$postId');
  final responseJson = json.decode(response.body);

  return new Post.fromJSON(responseJson);
}
