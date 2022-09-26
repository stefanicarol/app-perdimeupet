import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
        color: AppTheme.defaultTheme.primaryColor,
      ),
      child: Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
