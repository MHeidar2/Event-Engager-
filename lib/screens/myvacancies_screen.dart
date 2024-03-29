import 'package:flutter/material.dart';
import '../models/vacancy.dart';
import '../providers/exhibitor_provider.dart';
import 'package:provider/provider.dart';

class MyVacanciesPage extends StatefulWidget {
  MyVacanciesPage({Key key}) : super(key: key);
  @override
  _MyVacanciesPageState createState() => new _MyVacanciesPageState();
}

class _MyVacanciesPageState extends State<MyVacanciesPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ExhibitorProvider>(context, listen: false).fetchExhibitor();
    int _selectedIndex = 1;
    void _onItemTapped(int index) {
      setState(() {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/exhibitorhome');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/applicants');
        }
        /*else if (index == 3) {
        Navigator.pushNamed(context, '/menu');
      }*/
      });
    }

    List<Widget> myVacanciesWidget(List<Vacancy> myvac) {
      List<Widget> widgets = [];
      myvac.forEach((element) {
        widgets.add(
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(element.name),
              subtitle: Text(element.requiredExp),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        );
      });

      return widgets;
    }

    //list of exhibitors

    Widget viewMyVacancies() {
      return Consumer<ExhibitorProvider>(
        builder: (context, exhibitorProvider, _) {
          if (exhibitorProvider.exhibitor.myVacancies != null &&
              exhibitorProvider.exhibitor.myVacancies.isNotEmpty) {
            return ListView(
              children:
                  myVacanciesWidget(exhibitorProvider.exhibitor.myVacancies),
            );
          } else if (exhibitorProvider.exhibitor.myVacancies == null ||
              exhibitorProvider.exhibitor.myVacancies.isEmpty) {
            return Container();
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }

    //list of exhibitors

    /*ListView viewVacancies(int index) {
    if (index == 0) {
      return (ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Mobile Developer'),
              subtitle: Text('Vodafone'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Web Developer'),
              subtitle: Text('Robusta'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ));
    } else {
      return (ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Web Developer'),
              subtitle: Text('Robusta'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ));
    }
  }*/

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Vacancies'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_vacancy');
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ))
        ],
        /*bottom: new TabBar(
              tabs: [Tab(text: "All"), Tab(text: "Applied")],
            ),*/
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
            /*Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //onTap: () => ,
                ),
              ),*/
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
      /*body: TabBarView(
            children: [
              viewVacancies(0),
              viewVacancies(1),
            ],
          ),*/
      body: viewMyVacancies(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            label: 'My Vacancies',
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
    );
  }
}
