import 'package:flutter/material.dart';
import 'package:perdimeupet/pages/find/find_page.dart';
import 'package:perdimeupet/pages/lost/lost_page.dart';
import 'package:perdimeupet/pages/register_pet/register_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[];
  @override
  void initState() {
    _pages.add(const LostPage());
    _pages.add(const RegisterPage());
    _pages.add(const FindPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.pets),
            title: const Text("Perdidos"),
            selectedColor: AppTheme.defaultTheme.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.add),
            title: const Text("Cadastrar"),
            selectedColor: AppTheme.defaultTheme.secondaryHeaderColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.pets),
            title: const Text("Achados"),
            selectedColor: AppTheme.defaultTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
