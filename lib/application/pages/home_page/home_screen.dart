import 'package:flutter/material.dart';
import 'package:learning_app/application/pages/home_screen/home.dart';
import 'package:learning_app/application/pages/message_page/message_screen.dart';
import 'package:learning_app/application/pages/play_page/play_screen.dart';
import 'package:learning_app/application/pages/profile_page/profile_screen.dart';
import 'package:learning_app/application/pages/search_page/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;
  List<Widget> screens = const [
    HomeScreen(),
    SearchPage(),
    PlayPage(),
    MessagePage(),
    ProfilePage()
  ];
  void _onpressed(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[_selectedItem],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: const [
       BottomNavigationBarItem(icon:

        Icon(Icons.home,),label: "home"),
       BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
       BottomNavigationBarItem(icon: Icon(Icons.play_arrow),label: 'play'),
       BottomNavigationBarItem(icon: Icon(Icons.message_rounded),label: 'message'),
       BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile')
      ],
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      onTap: _onpressed,
      currentIndex: _selectedItem,

      ),
    );
  }
}
