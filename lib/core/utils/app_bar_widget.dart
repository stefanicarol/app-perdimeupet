import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'utils.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final BuildContext context;

  const AppBarWidget({Key? key, required this.title, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20.0, right: 18.0),
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: AppTheme.defaultTheme.primaryColor,
        ),
        child: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: getAppBottomView()));
  }
}

Widget getProfileView(User user) {
  return Stack(
    children: [
      CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(user.photoURL!),
        backgroundColor: Colors.transparent,
      )
    ],
  );
}

Widget getAppBottomView() {
  User? user = FirebaseAuth.instance.currentUser;

  return Container(
    padding: const EdgeInsets.only(left: 30, bottom: 18),
    child: Row(
      children: [
        getProfileView(user!),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getLastName(string: user.displayName!),
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                user.email!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(
          Icons.subject,
          color: Colors.white,
        ),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: getAppBottomView()),
      backgroundColor: AppTheme.defaultTheme.primaryColor,
      centerTitle: true,
      title: const Text(
        'PERDI MEU PET',
        style:
            TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
      ),
    );
  }
}
