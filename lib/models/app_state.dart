import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:flutter_redux_boilerplate/models/post.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState auth;
  final List<Post> posts;

  AppState({AuthState auth, List<Post> posts})
      : auth = auth ?? new AuthState(),
        posts = posts ?? null;

  static AppState rehydrationJSON(dynamic json) => new AppState(
        auth: new AuthState.fromJSON(json['auth']),
      );

  Map<String, dynamic> toJson() => {'auth': auth.toJSON()};

  AppState copyWith({
    bool rehydrated,
    AuthState auth,
  }) {
    return new AppState(auth: auth ?? this.auth);
  }

  @override
  String toString() {
    return '''AppState{
            auth: $auth,
            posts: $posts
        }''';
  }
}
