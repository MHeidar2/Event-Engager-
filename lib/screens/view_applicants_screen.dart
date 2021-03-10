import 'package:flutter/material.dart';
import 'package:miu_employment_fair/models/applicant.dart';
import 'package:miu_employment_fair/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class ViewApplicantsPage extends StatefulWidget {
  ViewApplicantsPage({Key key}) : super(key: key);
  @override
  _ViewApplicantsPageState createState() => new _ViewApplicantsPageState();
}

class _ViewApplicantsPageState extends State<ViewApplicantsPage> {
  //navigation bar
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/admin');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/viewexhibitors');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).fetchApplicants();

    List<Widget> applicantsWidget(List<Applicant> app) {
      List<Widget> widgets = [];
      app.forEach((element) {
        widgets.add(
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(element.name),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        );
      });
      return widgets;
    }

    Widget viewApplicants() {
      return Consumer<AdminProvider>(
        builder: (context, adminProvider, _) {
          if (adminProvider.allApplicants != null &&
              adminProvider.allApplicants.isNotEmpty) {
            return ListView(
              children: applicantsWidget(adminProvider.allApplicants),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text('Applicants'),
            backgroundColor: Colors.red,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
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
                    title: Text("Venue"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/map');
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.pushNamed(context, '/welcome');
                    },
                    //trailing: Icon(Icons.exit_to_app),
                  ),
                ),
              ],
            ),
          ),
          body: viewApplicants(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_paste),
                label: 'Exhibitors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: 'Applicants',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.blueGrey,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
