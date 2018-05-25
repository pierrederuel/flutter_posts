import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/auth_reducer.dart';
import 'package:flutter_redux_boilerplate/reducers/post_reducer.dart';
import 'package:redux_persist/redux_persist.dart';

AppState appReducer(AppState state, action) {
  //print(action);
  if (action is PersistLoadedAction<AppState>) {
    return action.state ?? state;
  } else {
    return new AppState(
        auth: authReducer(state.auth, action),
        posts: postReducer(state.posts, action));
  }
}
