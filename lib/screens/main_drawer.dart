import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/actions/post_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/styles/colors.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, dynamic>(
        converter: (store) => (BuildContext context) {
              store.dispatch(logout(context));
            },
        builder: (BuildContext context, logout) => new Drawer(
                child: new ListView(
              children: <Widget>[
                new Container(
                  height: 120.0,
                  child: new DrawerHeader(
                    padding: new EdgeInsets.all(0.0),
                    decoration: new BoxDecoration(
                      color: new Color(0xFFECEFF1),
                    ),
                    child: new Center(
                      child: new FlutterLogo(
                        colors: colorStyles['primary'],
                        size: 54.0,
                      ),
                    ),
                  ),
                ),
                new StoreConnector<AppState, dynamic>(
                    converter: (store) => (BuildContext context) {
                          store.dispatch(new GetPostsRequest());
                          Navigator.pushNamed(context, "/posts");
                        },
                    builder: (BuildContext context, goGetPosts) {
                      return new ListTile(
                        leading: new Icon(Icons.chat),
                        title: new Text('Get Posts'),
                        onTap: () => goGetPosts(context),
                      );
                    }),
                new ListTile(
                    leading: new Icon(Icons.info),
                    title: new Text('About'),
                    onTap: () => print('you pressed about')),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.exit_to_app),
                    title: new Text('Sign Out'),
                    onTap: () => logout(context)),
              ],
            )));
  }
}
