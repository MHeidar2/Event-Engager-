import 'package:flutter/material.dart';
import 'package:miu_employment_fair/models/exhibitor.dart';
import 'package:miu_employment_fair/providers/applicant_provider.dart';
import 'package:provider/provider.dart';

class ExhibitorPage extends StatefulWidget {
  ExhibitorPage({Key key}) : super(key: key);
  @override
  _ExhibitorPageState createState() => new _ExhibitorPageState();
}

class _ExhibitorPageState extends State<ExhibitorPage> {
  //navigation bar
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/vacancies');
      }
      /*else if (index == 3) {
        Navigator.pushNamed(context, '/menu');
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ApplicantProvider>(context, listen: false).fetchExhibitors();

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
      return Consumer<ApplicantProvider>(
        builder: (context, applicantProvider, _) {
          if (applicantProvider.allExhibitors != null &&
              applicantProvider.allExhibitors.isNotEmpty) {
            return ListView(
              children: exhibitorsWidget(applicantProvider.allExhibitors),
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
            bottom: new TabBar(
              tabs: [Tab(text: "All"), Tab(text: "For You")],
            ),
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
                    leading: FlutterLogo(size: 56.0),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
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
          body: TabBarView(
            children: [
              viewExhibitors(),
              viewExhibitors(),
            ],
          ),
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
                icon: Icon(Icons.content_paste),
                label: 'Vacancies',
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
