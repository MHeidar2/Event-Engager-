import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);
  @override
  _MenuPageState createState() => new _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu'),
        /*bottom: new TabBar(
          tabs: <Widget>[new Text("All"), new Text("For You")],
        ),*/
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.keyboard_arrow_right),
              //onTap: () => ,
            ),
          ),
          Card(
            child: ListTile(
              title: Text("About"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),
           Card(
            child: ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '/Welcome');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              //trailing: Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
    );
  }
}
