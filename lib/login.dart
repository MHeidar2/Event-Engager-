import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            SignInButton(
              Buttons.Google,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            SignInButton(
              Buttons.LinkedIn,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            SizedBox(
              height: 80,
            ),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              Text("OR"),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
            ]),
            SizedBox(
              height: 80,
            ),
            Container(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Login', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ])),
    );
  }
}
