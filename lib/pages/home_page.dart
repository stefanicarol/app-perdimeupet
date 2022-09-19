import 'package:flutter/material.dart';
import 'package:perdimeupet/pages/find/find_page.dart';
import 'package:perdimeupet/pages/lost/lost_page.dart';
import 'package:perdimeupet/pages/register_pet/register_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List _pages = [
    const FindPage(),
    const LostPage(),
    const RegisterPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Perdidos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets_sharp), label: "Achados"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), label: "Cadastrar"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
