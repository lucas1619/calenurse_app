import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimarySelect<T> extends StatefulWidget {
  final T value;
  final List<T> items;
  ValueChanged<T?> onChanged;

  PrimarySelect({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  PrimarySelectState<T> createState() => PrimarySelectState<T>();
}

class PrimarySelectState<T> extends State<PrimarySelect<T>> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFE9F3FF),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 20.0,
          ),
          child: DropdownButton<T>(
            underline: Container(),
            isExpanded: true,
            value: widget.value,
            onChanged: widget.onChanged,
            items: widget.items.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
