/*drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
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
              //trailing: Icon(Icons.exit_to_app),
            ),
          
      ),
      ],
    ),
  ),*/
