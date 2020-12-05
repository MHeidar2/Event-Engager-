import 'package:flutter/material.dart';

class ApplyPage extends StatefulWidget {
  ApplyPage({Key key}) : super(key: key);
  @override
  _ApplyPageState createState() => new _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Apply'),
        
      ),
      body: Center(),
    );
  }
}
