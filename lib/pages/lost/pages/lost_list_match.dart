import 'package:flutter/material.dart';

class LostListMatch extends StatefulWidget {
  const LostListMatch({Key? key}) : super(key: key);

  @override
  _LostListMatchState createState() => _LostListMatchState();
}

class _LostListMatchState extends State<LostListMatch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MATCHS",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Image.asset(
                  "assets/gatos/1.png",
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: const Text('Angorá'),
                subtitle: const Text('Achado: 16/10/2022'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/gatos/2.png",
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: const Text('Angorá'),
                subtitle: const Text('Achado: 17/10/2022'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/gatos/3.png",
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: const Text('Angorá'),
                subtitle: const Text('Achado: 18/10/2022'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/gatos/4.png",
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: const Text('Angorá'),
                subtitle: const Text('Achado: 21/10/2022'),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
