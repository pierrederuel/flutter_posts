import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/post.dart';
import 'package:flutter_redux_boilerplate/screens/post_screen.dart';
import 'package:redux/redux.dart';

typedef GetPostCallback = Function(String postId, Map<String, dynamic> params);

class PostListScreen extends StatelessWidget {
  PostListScreen({Key key}) : super(key: key ?? new Key("PostsScreen"));

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, vm) {
          if (vm.posts == null)
            return new Center(
              child: new CircularProgressIndicator(),
            );

          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Liste des posts"),
            ),
            body: _buildListView(vm.posts),
          );
        });
  }

  ListView _buildListView(List<Post> posts) {
    return new ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];

        return new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Hero(
                  tag: post.id.toString(),
                  child: new Image.network(
                      "https://www.brinkxl.nl/dbimg/news/wijziging-bezoek--en-postadres-brink-xl/item_110.jpg"),
                ),
                title: new Text(post.title),
              ),
              new ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: new Text("Voir le post"),
                      onPressed: () {
                        return Navigator
                            .of(context)
                            .push(new MaterialPageRoute<void>(
                              settings: null,
                              builder: (BuildContext context) => new PostScreen(
                                    postId: post.id,
                                    post: post,
                                  ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Post> posts;

  _ViewModel({@required this.posts});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(posts: store.state.posts);
  }
}
