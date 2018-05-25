import 'package:flutter_redux_boilerplate/actions/post_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/post.dart';
import 'package:flutter_redux_boilerplate/utils/api_client.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createPostMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, GetPostsRequest>(getPosts)
    ];

final getPosts = _getStoresMiddleware();

Middleware<AppState> _getStoresMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    if (action is GetPostsRequest) {
      try {
        APIClient client = new APIClient("jsonplaceholder.typicode.com");
        var response = await client.getData(action.url, action.params);

        List<Post> posts =
            response.map<Post>((json) => new Post.fromJSON(json)).toList();

        store.dispatch(new GetPostsSuccess(posts));
      } catch (error) {
        print("Error while getting posts");
        store.dispatch(new GetPostsFailure(error.toString()));
      }
    }

    next(action);
  };
}
