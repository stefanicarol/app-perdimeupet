import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/app_theme.dart';

class Filter extends StatefulWidget {
  final Function onPressDog;
  final Function onPressCat;
  final Function onPressAll;

  const Filter({
    Key? key,
    required this.onPressDog,
    required this.onPressCat,
    required this.onPressAll,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Color isColorFilter = AppTheme.defaultTheme.secondaryHeaderColor;
  Color isNotColorFilter = Colors.white;
  bool cat = false;
  bool dog = false;
  bool all = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          icon: const Icon(FontAwesomeIcons.dog, color: Colors.black87),
          label: const Text(
            "Auau",
            style: TextStyle(color: Colors.black87),
          ),
          onPressed: () {
            widget.onPressDog();
            setState(() {
              cat = false;
              dog = true;
              all = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: dog ? isColorFilter : isNotColorFilter,
            side: BorderSide(
                width: 1.5, color: dog ? isColorFilter : Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        OutlinedButton.icon(
          icon: const Icon(FontAwesomeIcons.cat, color: Colors.black87),
          label: const Text(
            "Miau",
            style: TextStyle(color: Colors.black87),
          ),
          onPressed: () {
            widget.onPressCat();
            setState(() {
              cat = true;
              dog = false;
              all = false;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: cat ? isColorFilter : isNotColorFilter,
            side: BorderSide(
                width: 1.5, color: cat ? isColorFilter : Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.pets, color: Colors.black),
          label: const Text(
            "Todos",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            widget.onPressAll();
            setState(() {
              cat = false;
              dog = false;
              all = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: all ? isColorFilter : isNotColorFilter,
            side: BorderSide(
                width: 1.5, color: all ? isColorFilter : Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ],
    );
  }
}
