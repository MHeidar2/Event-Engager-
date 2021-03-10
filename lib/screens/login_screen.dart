import 'package:flutter/material.dart';
import '../Service/flutterfire.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

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
            Container(
              width: 300,
              child: TextFormField(
                controller: _emailField,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
                color: Colors.red,
                onPressed: () async {
                  String shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate == 'Exhibitor') {
                    Navigator.pushReplacementNamed(context, '/exhibitorhome');
                  } else if (shouldNavigate == 'Applicant') {
                    Navigator.pushReplacementNamed(context, '/');
                  } else if (shouldNavigate == 'Admin') {
                    Navigator.pushReplacementNamed(context, '/admin');
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              height: 40,
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
              height: 40,
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ])),
    );
  }
}
