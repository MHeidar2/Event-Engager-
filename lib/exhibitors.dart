import 'package:flutter/material.dart';

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
      } else if (index == 3) {
        Navigator.pushNamed(context, '/menu');
      }
    });
  }

  //list of exhibitors

  ListView viewExhibitors(int index) {
    if (index == 0) {
      return (ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Vodafone'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Robusta'),
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
              title: Text('Robusta'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text('Exhibitors'),
            backgroundColor: Colors.red,
            bottom: new TabBar(
              tabs: [Tab(text: "All"), Tab(text: "For You")],
            ),
          ),
          body: TabBarView(
            children: [
              viewExhibitors(0),
              viewExhibitors(1),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
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