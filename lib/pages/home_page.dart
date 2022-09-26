import 'package:flutter/material.dart';
import 'package:perdimeupet/pages/find/find_page.dart';
import 'package:perdimeupet/pages/lost/lost_page.dart';
import 'package:perdimeupet/pages/register_pet/register_page.dart';

import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[];
  @override
  void initState() {
    _pages.add(FindPage());
    _pages.add(const RegisterPage());
    _pages.add(const LostPage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight + 3.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(
                  color: AppTheme.defaultTheme.primaryColor,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                elevation: 1,
                currentIndex: _currentIndex,
                backgroundColor: AppTheme.defaultTheme.primaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white54,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.pets), label: 'Perdidos'),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.pets), label: 'Achados')
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1
              ? Colors.grey
              : AppTheme.defaultTheme.secondaryHeaderColor,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () => setState(() {
            _currentIndex = 1;
          }),
        ),
      ),
    );
  }
}
