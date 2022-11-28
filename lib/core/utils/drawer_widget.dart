import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../theme/app_theme.dart';

class DrawerWidget extends StatelessWidget {
  final User user;

  const DrawerWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: AppTheme.defaultTheme.primaryColor),
            accountEmail: Text(user.email!),
            accountName: Text(user.displayName!),
            currentAccountPicture: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(user.photoURL!),
              backgroundColor: Colors.transparent,
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.pets, color: AppTheme.defaultTheme.primaryColor),
            title: const Text("Meus pets"),
            onTap: () => Modular.to.navigate('/mypet'),
          ),
          ListTile(
            leading:
                Icon(Icons.close, color: AppTheme.defaultTheme.primaryColor),
            title: const Text("Sair"),
            onTap: () async {
              Widget cancelaButton = TextButton(
                child: Text(
                  "Não",
                  style: TextStyle(color: AppTheme.defaultTheme.primaryColor),
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              );
              Widget continuaButton = TextButton(
                child: Text(
                  "Sim",
                  style: TextStyle(color: AppTheme.defaultTheme.primaryColor),
                ),
                onPressed: () async {
                  await auth.signOut();
                  await googleSignIn.signOut();
                  Modular.to.navigate('/');
                },
              );
              AlertDialog alert = AlertDialog(
                title: const Text("Atenção"),
                content: const Text("Deseja realmente sair do aplicativo?"),
                actions: [
                  cancelaButton,
                  continuaButton,
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
