import 'package:flutter/material.dart';

class ExhibitorHomePage extends StatefulWidget {
  ExhibitorHomePage({Key key}) : super(key: key);
  @override
  _ExhibitorHomePageState createState() => new _ExhibitorHomePageState();
}

class _ExhibitorHomePageState extends State<ExhibitorHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/myvacancies');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/applicants');
      }
      /*else if (index == 3) {
        Navigator.pushNamed(context, '/menu');
      }*/
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
                      title: Text("Add Vacancy"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.pushNamed(context, '/add_vacancy');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("My QR Code"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.pushNamed(context, '/qr_generate');
                      },
                    ),
                  ),
                ],
              ))
            ],
          ),
          // Profile image
          /*Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            ),
          )*/
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
    );
  }
}
