import 'package:flutter/material.dart';

import 'device_info.dart';

class CustomDropDown<T> extends StatefulWidget {
  final T? selectedItem;
  final bool bold;
  final bool labelText;
  final double borderRadius;
  final Color color;
  final Color borderColor;
  final List<DropdownMenuItem<T>> items;
  final void Function(T)? onChanged;
  final bool enabled;
  final String? hintText;
  final String labelTitle;
  final T? initialItem;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Widget? hint;

  const CustomDropDown(
      {Key? key,
      required this.selectedItem,
      this.bold = true,
      this.borderRadius = 5.0,
      this.color = Colors.transparent,
      this.borderColor = Colors.black54,
      this.labelText = true,
      this.onChanged,
      required this.items,
      this.enabled = true,
      this.hintText,
      this.initialItem,
      this.labelTitle = "Tipo",
      this.hint,
      this.selectedItemBuilder})
      : super(key: key);

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = widget.initialItem;
    });
  }

  @override
  void didUpdateWidget(covariant CustomDropDown<T> oldWidget) {
    if (oldWidget.selectedItem != widget.selectedItem) {
      selectedItem = widget.selectedItem;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText
            ? Text(widget.labelTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                        widget.bold ? FontWeight.bold : FontWeight.normal))
            : const SizedBox(),
        const SizedBox(height: 5),
        SizedBox(
          height: 48,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(color: widget.borderColor),
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                alignment: AlignmentDirectional.topEnd,
                isExpanded: true,
                hint: widget.hint ??
                    Padding(
                      padding: EdgeInsets.only(right: Device.width * 0.3),
                      child: const Text(
                        "Selecione uma opção",
                        textAlign: TextAlign.start,
                      ),
                    ),
                value: selectedItem,
                selectedItemBuilder: widget.selectedItemBuilder,
                onChanged: (item) {
                  setState(() {
                    selectedItem = item;
                    widget.onChanged!(item as T);
                  });
                },
                items: widget.items,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
