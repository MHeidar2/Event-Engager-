import 'package:flutter/material.dart';
import 'package:miu_employment_fair/models/exhibitor.dart';
import 'package:miu_employment_fair/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class ViewExhibitorsPage extends StatefulWidget {
  ViewExhibitorsPage({Key key}) : super(key: key);
  @override
  _ViewExhibitorsPageState createState() => new _ViewExhibitorsPageState();
}

class _ViewExhibitorsPageState extends State<ViewExhibitorsPage> {
  //navigation bar
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/admin');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/viewapplicants');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).fetchExhibitors();

    List<Widget> exhibitorsWidget(List<Exhibitor> exh) {
      List<Widget> widgets = [];
      exh.forEach((element) {
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

    //list of exhibitors

    Widget viewExhibitors() {
      return Consumer<AdminProvider>(
        builder: (context, adminProvider, _) {
          if (adminProvider.allExhibitors != null &&
              adminProvider.allExhibitors.isNotEmpty) {
            return ListView(
              children: exhibitorsWidget(adminProvider.allExhibitors),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }

    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text('Exhibitors'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_exhibitor');
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ))
            ],
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
          body: viewExhibitors(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.storefront),
                label: 'Exhibitors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: 'Applicants',
              ),
              /*BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),*/
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
