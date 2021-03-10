import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key key}) : super(key: key);
  @override
  _AdminPageState createState() => new _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/viewexhibitors');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/viewapplicants');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        /*bottom: new TabBar(
          tabs: <Widget>[new Text("All"), new Text("For You")],
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 220.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('images/cover.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                        //leading: Icon(Icons.watch_later, color: Colors.red),
                        title: Text("Date and Time",
                            style: TextStyle(color: Colors.red)),
                        subtitle:
                            Text("Saturday, March 7, 2020 at 11 AM – 5 PM")),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("add_exhibitor"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.pushNamed(context, '/add_exhibitor');
                      },
                    ),
                  ),
                ],
              ))
            ],
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
    );
  }
}
