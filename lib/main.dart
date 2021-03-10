import 'dart:collection';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/exhibitors_screen.dart';
import 'screens/vacancies_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/apply_screen.dart';
import 'screens/about_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/exhibitorhome_screen.dart';
import 'screens/myvacancies_screen.dart';
import 'screens/applicants_screen.dart';
import 'screens/add_vacancy_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/map.dart';
import 'screens/admin_screen.dart';
import 'screens/add_exhibitor.dart';
import 'screens/view_exhibitors_screen.dart';
import 'screens/view_applicants_screen.dart';
import 'screens/qr_generate_screen.dart';
import 'providers/admin_provider.dart';
import 'providers/exhibitor_provider.dart';
import 'providers/applicant_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AdminProvider(),
          ),
          ChangeNotifierProvider.value(
            value: ExhibitorProvider(),
          ),
          ChangeNotifierProvider.value(
            value: ApplicantProvider(),
          ),
          // provider.ChangeNotifierProvider.value(
          //   value: TasksController(),
          // ),
        ],
        child: new MaterialApp(
            title: 'MIU Employment Fair',
            theme: new ThemeData(
              primarySwatch: Colors.red,
              primaryColor: const Color(0xFFf44336),
              accentColor: const Color(0xFFf44336),
              canvasColor: const Color(0xFFfafafa),
            ),
            initialRoute: '/welcome',
            routes: {
              // When navigating to the "/" route, build the HomePage widget.
              '/': (context) => MyHomePage(),
              '/exhibitors': (context) => ExhibitorPage(),
              '/vacancies': (context) => VacanciesPage(),
              '/menu': (context) => MenuPage(),
              '/apply': (context) => ApplyPage(),
              '/edit_profile': (context) => EditProfilePage(),
              '/login': (context) => LoginPage(),
              '/about': (context) => AboutPage(),
              '/welcome': (context) => WelcomePage(),
              '/register': (context) => RegisterPage(),
              '/exhibitorhome': (context) => ExhibitorHomePage(),
              '/myvacancies': (context) => MyVacanciesPage(),
              '/applicants': (context) => ApplicantsPage(),
              '/add_vacancy': (context) => AddVacancyPage(),
              '/add_exhibitor': (context) => AddExhibitorPage(),
              '/viewexhibitors': (context) => ViewExhibitorsPage(),
              '/viewapplicants': (context) => ViewApplicantsPage(),
              '/admin': (context) => AdminPage(),
              '/qr_generate': (context) => GeneratePage(),
              '/map': (context) => RealtimeMapScreen(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/exhibitors');
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
                      title: Text("Apply for Vacancies"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.pushNamed(context, '/apply');
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
    );
  }
}
/*import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIU Employment Fair',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('MIU Employment Fair'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'images/miu.jpg',
                width: 411.4,
                height: 240,
                fit: BoxFit.cover,
              ),
              TitleSection(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                BuildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
                BuildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          /*Icon(
            Icons.star,
            color: Colors.red[500],
          ),*/
          FavouriteWidget(),
          //Text('41'),
        ],
      ),
    );
  }
}

Column BuildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  bool _isFavourited = true;
  int _favouriteCount = 41;

  Widget build(BuildContext context) {
    var colors = Colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(child: Text('$_favouriteCount')),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavourited) {
        _favouriteCount -= 1;
        _isFavourited = false;
      } else {
        _favouriteCount += 1;
        _isFavourited = true;
      }
    });
  }
}
*/
