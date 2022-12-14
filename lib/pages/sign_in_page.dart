import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/services/firebase_service.dart';
import '../core/utils/constants.dart';
import '../core/utils/device_info.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = 'SignInPage';

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Device.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Constants.kPrimaryColor,
        body: Center(
            child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 300, child: Image.asset("assets/images/logo.png")),
            SizedBox(height: size.height * 0.01),
            const GoogleSignIn(),
            Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
          ]),
        )));
  }
}

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading
        ? SizedBox(
            width: size.width * 0.8,
            child: OutlinedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = FirebaseService();
                try {
                  await service.signInwithGoogle();
                  Modular.to.navigate('/homepage');
                } catch (e) {
                  if (e is FirebaseAuthException) {
                    showMessage(e.message!);
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: const Text(
                Constants.textSignInGoogle,
                style: TextStyle(
                    color: Constants.kBlackColor, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.kGreyColor),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : const CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
