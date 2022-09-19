import 'package:flutter/material.dart';

enum SingingCharacter { cachorro, gato, perdido, achado }

extension OptionsMapper on SingingCharacter {
  int get id {
    switch (this) {
      case SingingCharacter.achado:
        return 1;
      case SingingCharacter.cachorro:
        return 2;
      case SingingCharacter.gato:
        return 1;
      default:
        return 2;
    }
  }
}

class CustomRadioListTile extends StatefulWidget {
  final String title;
  final SingingCharacter groupValue;
  final SingingCharacter value;
  final Function(SingingCharacter?)? onChanged;

  const CustomRadioListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRadioListTile> createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<SingingCharacter>(
        title: Text(widget.title),
        contentPadding: const EdgeInsets.all(0),
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
      ),
    );
  }
}
