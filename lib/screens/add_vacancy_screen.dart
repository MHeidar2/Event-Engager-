import 'package:flutter/material.dart';
import '../providers/exhibitor_provider.dart';

class AddVacancyPage extends StatefulWidget {
  AddVacancyPage({Key key}) : super(key: key);
  @override
  _AddVacancyPageState createState() => new _AddVacancyPageState();
}

class _AddVacancyPageState extends State<AddVacancyPage> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _experienceField = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ExhibitorProvider exhibitorProvider = ExhibitorProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Add Vacancy'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Job Title:',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _nameField,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'ex: Senior Web Developer',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Experience:',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _experienceField,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'ex: 2-5 years experience'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          String shouldNavigate =
                              await exhibitorProvider.addVacancy(
                                  _nameField.text, _experienceField.text);
                          if (shouldNavigate == 'true') {
                            Navigator.pushReplacementNamed(
                                context, '/myvacancies');
                          }
                        },
                        child:
                            Text('Add', style: TextStyle(color: Colors.white)),
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
