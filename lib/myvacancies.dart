import 'package:flutter/material.dart';

class MyVacanciesPage extends StatefulWidget {
  MyVacanciesPage({Key key}) : super(key: key);
  @override
  _MyVacanciesPageState createState() => new _MyVacanciesPageState();
}

class _MyVacanciesPageState extends State<MyVacanciesPage> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: /*DefaultTabController(
        length: 2,
        child:*/
          Scaffold(
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
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //onTap: () => ,
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
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Junior Mobile Developer'),
                subtitle: Text('0-2 years experience'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Senior Web Developer'),
                subtitle: Text('2-5 years experience'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
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
      ),
    );
  }
}
