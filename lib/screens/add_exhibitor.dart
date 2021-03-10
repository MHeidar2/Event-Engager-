import 'package:flutter/material.dart';
import '../Service/flutterfire.dart';
import '../providers/admin_provider.dart';

class AddExhibitorPage extends StatefulWidget {
  AddExhibitorPage({Key key}) : super(key: key);
  @override
  _AddExhibitorPageState createState() => new _AddExhibitorPageState();
}

class _AddExhibitorPageState extends State<AddExhibitorPage> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _websiteField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AdminProvider admin = AdminProvider();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Add Exhibitor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameField,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Company Name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _websiteField,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(hintText: 'Website'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordField,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: () async {
                          bool shouldNavigate = await admin.addUser(
                              _nameField.text,
                              _websiteField.text,
                              _emailField.text,
                              _passwordField.text);
                          print(shouldNavigate);
                          if (shouldNavigate) {
                            Navigator.pushReplacementNamed(
                                context, '/viewexhibitors');
                          }
                        },
                        child:
                            Text("Add", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
