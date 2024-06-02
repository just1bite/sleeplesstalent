import 'package:flutter/material.dart';
import 'package:sleeplesstalented/main_app/home_screen.dart';
import 'package:sleeplesstalented/pages/news_screen/news_screen.dart';
import 'package:sleeplesstalented/pages/saved_screen/saved_screen.dart';
import 'package:sleeplesstalented/pages/detail_Screen/detail_screen.dart';
import 'package:sleeplesstalented/pages/login_screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();

  // Public method to change the tab
  static void changeTab(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<_MainScreenState>();
    state?._onItemTapped(index);
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    NewsScreen(),
    SavedScreen(),
    DetailScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 19, 1, 96),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
