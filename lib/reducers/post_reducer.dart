import 'package:flutter_redux_boilerplate/actions/post_actions.dart';
import 'package:flutter_redux_boilerplate/models/post.dart';
import 'package:redux/redux.dart';

Reducer<List<Post>> postReducer = combineReducers([
  new TypedReducer<List<Post>, GetPostsSuccess>(getPostsReducer),
]);

List<Post> getPostsReducer(List<Post> posts, GetPostsSuccess action) {
  return action.posts;
}
