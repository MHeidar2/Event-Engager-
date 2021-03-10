import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('About'),
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text("About MIU Employment fair",
                    style: TextStyle(color: Colors.red)),
                subtitle: Text(
                    "MIU Employment Fair provides Students and Alumni from all faculties with job opportunities in different sectors by connecting them with potential employers to apply for their relevant jobs."),
              ),
            ),
            Card(
              child: ListTile(
                  //leading: Icon(Icons.watch_later, color: Colors.red),
                  title: Text("Date and Time",
                      style: TextStyle(color: Colors.red)),
                  subtitle: Text("Saturday, March 7, 2020 at 11 AM – 5 PM")),
            ),
          ],
        ));
  }
}
