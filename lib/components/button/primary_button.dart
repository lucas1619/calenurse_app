import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final BuildContext parentContext;
  final void Function(BuildContext) action;
  final String label;

  const PrimaryButton(
      {super.key,
      required this.action,
      required this.label,
      required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action(parentContext);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          backgroundColor: const Color(0xFF4894FE)),
      child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ))),
    );
  }
}
