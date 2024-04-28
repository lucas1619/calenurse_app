import 'package:flutter/material.dart';

class HeaderBack extends StatelessWidget {
  final String title;

  const HeaderBack({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF264A7D),
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}
