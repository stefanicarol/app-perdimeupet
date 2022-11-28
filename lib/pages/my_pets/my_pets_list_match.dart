import 'package:flutter/material.dart';

class MyPetListMatch extends StatefulWidget {
  const MyPetListMatch({Key? key}) : super(key: key);

  @override
  MyPetListMatchState createState() => MyPetListMatchState();
}

class MyPetListMatchState extends State<MyPetListMatch> {
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
