import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimarySelect extends StatefulWidget {
  final String value;
  final List<String> items;
  ValueChanged<String?> onChanged;

  PrimarySelect({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  PrimarySelectState createState() => PrimarySelectState();
}

class PrimarySelectState extends State<PrimarySelect> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // background color
            color: const Color(0xFFE9F3FF),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 20.0,
          ),
          child: DropdownButton<String>(
            underline: Container(),
            isExpanded: true,
            value: widget.value,
            onChanged: widget.onChanged,
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
